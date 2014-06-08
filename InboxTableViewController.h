//
//  InboxTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 31/05/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface InboxTableViewController : UITableViewController
@property(nonatomic, strong) NSArray *messages;
@property(nonatomic, strong) PFObject *selectedMessage;
- (IBAction)logout:(id)sender;

@end
