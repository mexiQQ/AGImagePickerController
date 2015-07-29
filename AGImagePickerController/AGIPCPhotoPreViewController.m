//
//  AGIPCPhotoPreViewController.m
//  AGImagePickerController Demo
//
//  Created by MexiQQ on 15/7/27.
//  Copyright (c) 2015年 Artur Grigor. All rights reserved.
//

#import "AGIPCPhotoPreViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AGIPCPhotoPreviewContentViewController.h"

@interface AGIPCPhotoPreViewController ()
@property (nonatomic,assign) NSInteger index;
@end

@implementation AGIPCPhotoPreViewController

- (instancetype)initWithPhotoes:(NSArray *)selectPhoto{
    self = [super init];
    if(self){
        self.selectPhoto = [NSMutableArray arrayWithArray:selectPhoto];
    }
    return self;
}

- (void)loadView{
    self.view = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageController.view.frame = CGRectMake(self.view.bounds.origin.x , self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height );
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.hidden = YES;
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height - 44 , [UIScreen mainScreen].bounds.size.width, 44)];
    bottomView.backgroundColor = [UIColor colorWithRed:20.0f/255 green:20.0f/255 blue:20.0f/255 alpha:1.0f];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 10 - 40, 4, 40, 36)];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [bottomView addSubview:button];
    
    [self.pageController.view addSubview:bottomView];
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
    
    self.index = 1;
}

- (void)viewWillAppear:(BOOL)animated{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    if ((self.selectPhoto.count == 0) || (index >= self.selectPhoto.count)) {
        return nil;
    }
    
    ALAsset *tmpAsset = (ALAsset *)self.selectPhoto[index];
    AGIPCPhotoPreviewContentViewController *pageContentViewController = [[AGIPCPhotoPreviewContentViewController alloc] initWithALAsset:tmpAsset];
    
    pageContentViewController.pageIndex = (NSInteger *)index;
    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = (int)((AGIPCPhotoPreviewContentViewController *)viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = (int)((AGIPCPhotoPreviewContentViewController *)viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == self.selectPhoto.count) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController: (UIPageViewController *)pageViewController {
    return self.selectPhoto.count;
}

- (NSInteger)presentationIndexForPageViewController: (UIPageViewController *)pageViewController {
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
@end