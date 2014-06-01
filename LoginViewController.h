//
//  LoginViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 01/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)login:(id)sender;

@end
