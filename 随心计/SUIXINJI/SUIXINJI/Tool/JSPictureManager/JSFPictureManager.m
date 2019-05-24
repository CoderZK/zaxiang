//
//  JSFPictureManager.m
//  JSFPictureManager
//
//  Created by nuomi on 2017/9/14.
//  Copyright © 2017年 jsf. All rights reserved.
//

#import "JSFPictureManager.h"
#import "GroupTableViewController.h"

@implementation JSFPictureManager

+ (JSFPictureManager *)sharedManager {
    static JSFPictureManager * sharedManager = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
/**
 *选择一张照片
 *
 */
+ (void)shareGetPicture:(getPictureBlock)block {
    
    //开启一个子线程,将耗时操作放到异步串行队列
//    dispatch_queue_t queue = dispatch_queue_create("getOneImage", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
        JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
        // 将image回调到主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
//        });
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:kALERTTITLE message:nil preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIAlertAction *CameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *CameraAction){
                [getPicture openCamera];
            }];
            [alertController addAction:CameraAction];
        }
        
        UIAlertAction *ImageAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *ImageAction){
            [getPicture openAlbum];
        }];
        [alertController addAction:ImageAction];
        
//        UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"图片库" style:UIAlertActionStyleDefault handler:^(UIAlertAction *ImageAction){
//            [getPicture openGallery];
//        }];
//        [alertController addAction:galleryAction];
    
        [AppRootViewController presentViewController:alertController animated:YES completion:nil];
        
//    });
    
}

/**
 *选择相机获取照片
 *
 */
- (void)getPictureFromCamera :(getPictureBlock)block{
    //开启一个子线程,将耗时操作放到异步串行队列
    dispatch_queue_t queue = dispatch_queue_create("getCameraImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
        // 将image回调到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openCamera];
    });
    
}

/**
 *选择相册
 *
 */
- (void)getPictureFromAlbum:(getPictureBlock)block{
    
    //开启一个子线程,将耗时操作放到异步串行队列
    dispatch_queue_t queue = dispatch_queue_create("getAlbumImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
        // 将image回调到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openAlbum];
    });
    
}

/**
 *选择图片库
 *
 */
- (void)getPictureFromGallery:(getPictureBlock)block{
    //开启一个子线程,将耗时操作放到异步串行队列
    dispatch_queue_t queue = dispatch_queue_create("getGalleryImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
        // 将image回调到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openGallery];
    });
    
}

#pragma mark - Camera
- (void)openCamera {
    JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        //无权限
        [getPicture showAlertViewWithTitel:kNOTSUPPORTCAMERAL];
        
    }else{
        // 相机 UIImagePickerControllerSourceTypeCamera
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypeCamera];
    }
}

#pragma mark - Album
- (void)openAlbum {
    JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        //相册权限受限制
        [getPicture showAlertViewWithTitel:kNOTSUPPORTALBUM];
    }else{
        // 相册
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}

#pragma mark - Gallery
- (void)openGallery {
    JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
    {
        //无权限
        [getPicture showAlertViewWithTitel:kNOTSUPPORTGALLERY];
        
    }else{
        // 图片库
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}



#pragma mark - ImagePickerController
- (void)setImagePickerControllerWith:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = [JSFPictureManager sharedManager];
    imagePicker.sourceType = type;
    imagePicker.allowsEditing = YES;
    [AppRootViewController presentViewController:imagePicker animated:YES completion:nil];
}


#pragma mark - showAlertView
- (void)showAlertViewWithTitel:(NSString *)title{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [alertController addAction:cancelAction];
    [AppRootViewController presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [getPicture pictureBlock](image);
}

/**
 *选择多张照片
 *
 */
- (void)getMultiplePictureInViewController:(__weak UIViewController *)controller count:(NSInteger)count block:(getMultiplePictureBlock)block{
    JSFPictureManager * getPicture = [JSFPictureManager sharedManager];
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied)
    {
        //无权限
        [getPicture showAlertViewWithTitel:kNOTSUPPORTGALLERY];
        block(nil,@"无法访问图片库");
    }else{
        self.multiplePictureBlock = block;
        GroupTableViewController * albumControl = [[GroupTableViewController alloc] init];
        //告诉这个控制器已经选中了多少张图片
        albumControl.selectCount = count;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:albumControl];
        [controller presentViewController:nav animated:YES completion:nil];
        
    }
}










@end
