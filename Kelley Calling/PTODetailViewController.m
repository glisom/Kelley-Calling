//
//  PTODetailViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 8/30/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "PTODetailViewController.h"

@interface PTODetailViewController ()

@end

@implementation PTODetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:.67 green:0 blue:0 alpha:1];
    _name.text = _pto.name;
    if ([_pto.position isEqual:@"PRESIDENT:"]) {
        _position.text = @"President";
    } else if ([_pto.position isEqual:@"PAST PRESIDENT:"]) {
        _position.text = @"Past President";
    } else if ([_pto.position isEqual:@"PRESIDENT-ELECT:"]) {
        _position.text = @"President Elect";
    } else if ([_pto.position isEqual:@"SECRETARY:"]) {
        _position.text = @"Secretary";
    } else {
        _position.text = @"Treasurer";
    }
    _position.text = _pto.position;
    _emailAddress.titleLabel.text = _pto.email;
    _phoneNumber.titleLabel.text = _pto.phone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller

                 didFinishWithResult:(MessageComposeResult)result

{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
