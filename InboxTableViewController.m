//
//  InboxTableViewController.m
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 31/05/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import "InboxTableViewController.h"
#import <Parse/Parse.h>

@interface InboxTableViewController ()

@end

@implementation InboxTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"%@", currentUser);
    } else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    PFQuery *query = [PFQuery queryWithClassName:@"Messages"];
    [query whereKey:@"recipientIds" equalTo:[[PFUser currentUser] objectId]];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error){
            NSLog(@"%@ %@", error, [error userInfo]);
        } else {
            self.messages = objects;
            [self.tableView reloadData];
            NSLog(@"# messages: %lu", (unsigned long)[self.messages count]);
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIndetifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier
                                                            forIndexPath:indexPath];
    
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [message objectForKey:@"senderName"];
    
    return cell;
}

#pragma mark - Actions

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showLogin" ]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
}
@end
