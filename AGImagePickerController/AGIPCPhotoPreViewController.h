//
//  AGIPCPhotoPreViewController.h
//  AGImagePickerController Demo
//
//  Created by MexiQQ on 15/7/27.
//  Copyright (c) 2015年 Artur Grigor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGIPCPhotoPreViewController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *selectPhoto;
@property (nonatomic,strong) UIPageViewController *pageController;
- (instancetype)initWithPhotoes:(NSArray *)selectPhoto;
@end
