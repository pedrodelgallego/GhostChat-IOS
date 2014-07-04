//
//  InboxTableViewController.h
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 31/05/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InboxTableViewController : UITableViewController
@property(nonatomic, strong) NSArray *messages;
@property(nonatomic, strong) PFObject *selectedMessage;
@property(nonatomic, strong) MPMoviePlayerController *moviePlayer;

- (IBAction)logout:(id)sender;

@end
