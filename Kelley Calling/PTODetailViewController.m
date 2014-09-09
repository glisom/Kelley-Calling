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
    if ([_pto.phone isEqual:@""]) {
        _phoneNumber.enabled = NO;
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateNormal];
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateHighlighted];
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateDisabled];
        
    }else {
        [_phoneNumber setTitle:_pto.phone forState:UIControlStateNormal];
        [_phoneNumber setTitle:_pto.phone forState:UIControlStateHighlighted];
    }
    if ([_pto.email isEqual:@""]) {
        _emailAddress.enabled = NO;
        [_emailAddress setTitle:@"Not Found" forState:UIControlStateDisabled];
    } else {
        [_emailAddress setTitle:_pto.email forState:UIControlStateNormal];
        [_emailAddress setTitle:_pto.email forState:UIControlStateSelected];
    }
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

- (IBAction)phonePressed:(id)sender {
    
    if (![_pto.phone  isEqual: @""]) {
        NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"tel:", _pto.phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
    }
    
}

- (IBAction)emailPressed:(id)sender {
    if (![_pto.email isEqual:@""]) {
        NSArray *myArray = [NSArray arrayWithObjects:_pto.email, nil];
        if ([MFMailComposeViewController canSendMail]) {
            
            MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
            mailViewController.mailComposeDelegate = self;
            [mailViewController setToRecipients:myArray];
            [mailViewController setSubject:@""];
            [mailViewController setMessageBody:@"" isHTML:NO];
            
            [self presentViewController:mailViewController animated:YES completion:NULL];
        }
        
        else {
            
        }
    }
}

- (IBAction)messagePressed:(id)sender {
    if (![_pto.phone  isEqual: @""]) {
        //NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"sms:", _directory.studentPhone];
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
        NSArray *myArray = [NSArray arrayWithObjects:_pto.phone, nil];
        if ([MFMessageComposeViewController canSendText]) {
            
            MFMessageComposeViewController *messageView = [[MFMessageComposeViewController alloc] init];
            messageView.messageComposeDelegate = self;
            [messageView setRecipients:myArray];
            [self presentViewController:messageView animated:YES completion:NULL];
        }
        
        else {
            
        }
    }
}

@end
