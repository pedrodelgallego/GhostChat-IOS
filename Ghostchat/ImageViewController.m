 //
//  ImageViewController.m
//  Ghostchat
//
//  Created by Pedro Del Gallego Vida on 08/06/14.
//  Copyright (c) 2014 Cingo. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFFile *imageFile = [self.message objectForKey:@"file"];
    
    NSURL *imageFileUrl = [[NSURL alloc] initWithString: imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL: imageFileUrl];
    self.imageView.image = [UIImage imageWithData:imageData];

    NSString *sender = [self.message objectForKey:@"senderName"];
    NSString *title = [NSString stringWithFormat:@"Sent by %@", sender];
    self.navigationItem.title = title;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if ([self respondsToSelector:@selector(timeout)]) {
        [NSTimer scheduledTimerWithTimeInterval:10
                                     target:self
                                   selector:@selector(timeout)
                                   userInfo:nil
                                    repeats:NO];
    } else {
        NSLog(@"Error: selector missing");
    }
}

#pragma helper methods
- (void) timeout {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
