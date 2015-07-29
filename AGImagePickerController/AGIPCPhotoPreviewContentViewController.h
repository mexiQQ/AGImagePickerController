//
//  AGIPCPhotoPreviewContentViewController.h
//  AGImagePickerController Demo
//
//  Created by MexiQQ on 15/7/29.
//  Copyright (c) 2015年 Artur Grigor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface AGIPCPhotoPreviewContentViewController : UIViewController

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) ALAsset *asset;
@property (nonatomic,assign) NSInteger *pageIndex;
- (instancetype)initWithALAsset:(ALAsset *)asset;
@end
