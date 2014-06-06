//
//  EditFriendsTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 05/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsTableViewController : UITableViewController

@property(nonatomic, strong) NSArray *allUsers;
@property(nonatomic, strong) PFUser *currentUser;

@end
