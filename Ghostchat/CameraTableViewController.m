//
//  CameraTableViewController.m
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 07/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import "CameraTableViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface CameraTableViewController ()

@end

@implementation CameraTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
    self.recipients = [[NSMutableArray alloc] init];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = NO;
    self.imagePicker.videoMaximumDuration = 10;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];

    [self presentViewController:self.imagePicker animated:NO completion:nil];

    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error){
            NSLog(@"%@ %@", error, error.userInfo);
        } else {
            self.friends = objects;
            [self.tableView reloadData];
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
    return [self.friends count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIndetifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier
                                                            forIndexPath:indexPath];
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
 
    if ([self.recipients containsObject:user.objectId]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
    PFUser *user = [self.friends objectAtIndex:indexPath.row];

    if (cell.accessoryType == UITableViewCellAccessoryCheckmark){
        [self.recipients addObject:user.objectId];
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        [self.recipients removeObject:user.objectId];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

#pragma mark - Image picker controller delegate
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.tabBarController setSelectedIndex:0];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
 
    if ([mediaType isEqualToString:(NSString *) kUTTypeImage]){
        self.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera){
            UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        }
    } else {
        self.videoFilePath = (__bridge NSString *)([[info objectForKey:UIImagePickerControllerMediaURL] path]);
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(self.videoFilePath)){
            UISaveVideoAtPathToSavedPhotosAlbum(self.videoFilePath, nil, nil, nil);
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - Actions
- (IBAction)cancel:(id)sender {
    self.videoFilePath = nil;
    self.image = nil;
    [self.recipients removeAllObjects];

    [self.tabBarController setSelectedIndex:0];
}
@end
