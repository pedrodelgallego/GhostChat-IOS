//
//  ImageViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 08/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) PFObject *message;
@end
