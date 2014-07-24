//
//  SignUpViewController.m
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 01/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([self isValidForm:username password:password email:email]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"upss" message:@"username, password, and email cannot be blank" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    } else {
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if  (error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                                    message:[error.userInfo objectForKey:@"error"]
                                                                   delegate:nil
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil, nil];
                [alertView show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

- (IBAction)dismiss:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(BOOL) isValidForm:(NSString*)username password:(NSString*)password email:(NSString*)email{
    return [username length] == 0 || [password length] == 0 || [email length] == 0;
}
@end
