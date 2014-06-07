//
//  CameraTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 07/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraTableViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, strong) UIImagePickerController *imagePicker;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) NSString *videoFilePath;
@end
