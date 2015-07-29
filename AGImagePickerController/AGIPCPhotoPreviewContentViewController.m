//
//  AGIPCPhotoPreviewContentViewController.m
//  AGImagePickerController Demo
//
//  Created by MexiQQ on 15/7/29.
//  Copyright (c) 2015年 Artur Grigor. All rights reserved.
//

#import "AGIPCPhotoPreviewContentViewController.h"

@implementation AGIPCPhotoPreviewContentViewController

- (instancetype)initWithALAsset:(ALAsset *)asset{
    self = [super init];
    if(self){
        self.asset = asset;
    }
    return self;
}

- (void)loadView{
    [super loadView];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0., 0, 400, 400)];
    self.imageView.image = [UIImage imageWithCGImage:self.asset.defaultRepresentation.fullScreenImage];
    [self.view addSubview:self.imageView];;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}
@end
