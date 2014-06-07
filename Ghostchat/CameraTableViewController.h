//
//  CameraTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 07/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CameraTableViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, strong) UIImagePickerController *imagePicker;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) NSString *videoFilePath;
@property(nonatomic, strong) PFRelation *friendsRelation;
@property(nonatomic, strong) NSArray *friends;
@property(nonatomic, strong) NSMutableArray *recipients;


- (IBAction)cancel:(id)sender;


@end
