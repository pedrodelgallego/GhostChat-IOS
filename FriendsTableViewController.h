//
//  FriendsTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 06/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface FriendsTableViewController : UITableViewController

@property(nonatomic, strong) PFRelation *friendsRelation;
@property(nonatomic, strong) NSArray *friends;
@end
