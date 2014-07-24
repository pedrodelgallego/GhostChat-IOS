//
//  SignUpViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 01/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signup:(id)sender;

- (IBAction)dismiss:(id)sender;

@end
