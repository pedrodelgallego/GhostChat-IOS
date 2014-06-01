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
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
@end
