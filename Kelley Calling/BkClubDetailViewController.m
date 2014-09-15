//
//  BkClubDetailViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 9/14/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "BkClubDetailViewController.h"

@interface BkClubDetailViewController ()

@end

@implementation BkClubDetailViewController

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
    if ([_club.phone isEqual:@""]) {
        _phoneNumber.enabled = NO;
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateNormal];
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateHighlighted];
        [_phoneNumber setTitle:@"Not Found" forState:UIControlStateDisabled];
        
    }else {
        [_phoneNumber setTitle:_club.phone forState:UIControlStateNormal];
        [_phoneNumber setTitle:_club.phone forState:UIControlStateHighlighted];
    }
    if ([_club.email isEqual:@""]) {
        _emailAddress.enabled = NO;
        [_emailAddress setTitle:@"Not Found" forState:UIControlStateDisabled];
    } else {
        [_emailAddress setTitle:_club.email forState:UIControlStateNormal];
        [_emailAddress setTitle:_club.email forState:UIControlStateSelected];
    }
    _name.text = _club.name;
    if ([_club.club isEqual:@"BK CLUB '15"]) {
        _clubName.text = @"BK Club '15";
    } else if ([_club.club isEqual:@"BK Club '16"]) {
        _clubName.text = @"BK Club '16";
    } else if ([_club.club isEqual:@"BK Club '17"]) {
        _clubName.text = @"BK Club '17";
    } else {
        _clubName.text = @"BK Club";
    }
    _clubName.text = _club.club;
    _emailAddress.titleLabel.text = _club.email;
    _phoneNumber.titleLabel.text = _club.phone;
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
    
    if (![_club.phone  isEqual: @""]) {
        NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"tel:", _club.phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
    }
    
}

- (IBAction)emailPressed:(id)sender {
    if (![_club.email isEqual:@""]) {
        NSArray *myArray = [NSArray arrayWithObjects:_club.email, nil];
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
    if (![_club.phone isEqual: @""]) {
        NSArray *myArray = [NSArray arrayWithObjects:_club.phone, nil];
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
