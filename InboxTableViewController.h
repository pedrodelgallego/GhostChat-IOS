//
//  InboxTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 31/05/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxTableViewController : UITableViewController
@property(nonatomic, strong) NSArray *messages;

- (IBAction)logout:(id)sender;

@end
