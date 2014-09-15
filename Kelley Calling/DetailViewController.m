//
//  DetailViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/26/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//


#import "DetailViewController.h"

@interface DetailViewController ()
@end

@implementation DetailViewController 
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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _firstName.text = _directory.firstName;
    _lastName.text = _directory.lastName;
    if ([_directory.addressLine1 isEqual:@""]) {
        _AddressLine1.enabled = NO;
        _AddressLine2.enabled = NO;
        [_AddressLine1 setTitle:@"Unlisted" forState:UIControlStateDisabled];
        [_AddressLine2 setTitle:@" " forState:UIControlStateDisabled];
        
    }else {
        [_AddressLine1 setTitle:_directory.addressLine1 forState:UIControlStateNormal];
        [_AddressLine1 setTitle:_directory.addressLine1 forState:UIControlStateHighlighted];
        [_AddressLine2 setTitle:_directory.addressLine2 forState:UIControlStateNormal];
        [_AddressLine2 setTitle:_directory.addressLine2 forState:UIControlStateHighlighted];
    }
    
    if ([_directory.studentPhone isEqual:@""]) {
        _phoneButton.enabled = NO;
        [_phoneButton setTitle:@"Not Found" forState:UIControlStateNormal];
        [_phoneButton setTitle:@"Not Found" forState:UIControlStateHighlighted];
        [_phoneButton setTitle:@"Not Found" forState:UIControlStateDisabled];
        
    }else {
        [_phoneButton setTitle:_directory.studentPhone forState:UIControlStateNormal];
        [_phoneButton setTitle:_directory.studentPhone forState:UIControlStateHighlighted];
    }
    
    if ([_directory.studentEmail isEqual:@""]) {
        _emailAddress.enabled = NO;
        [_emailAddress setTitle:@"Not Found" forState:UIControlStateDisabled];
    } else {
        [_emailAddress setTitle:_directory.studentEmail forState:UIControlStateNormal];
        [_emailAddress setTitle:_directory.studentEmail forState:UIControlStateSelected];
    }
    _parentsName.text = _directory.parentsName;
    if ([_directory.homePhone isEqual:@""] || [_directory.homePhone isEqual:@"Unlisted"]) {
        _homePhone.enabled = NO;
        [_homePhone setTitle:@"Not Found" forState:UIControlStateNormal];
        [_homePhone setTitle:@"Not Found" forState:UIControlStateHighlighted];
        [_homePhone setTitle:@"Not Found" forState:UIControlStateDisabled];
    }else {
        [_homePhone setTitle:_directory.homePhone forState:UIControlStateNormal];
        [_homePhone setTitle:_directory.homePhone forState:UIControlStateHighlighted];
    }
    
    _birthday.text = _directory.bday;
    _gradeLevel.text = _directory.grade;
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (IBAction)phonePressed:(id)sender {
    
    if (![_directory.studentPhone  isEqual: @""]) {
        NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"tel:", _directory.studentPhone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
    }
    
}
- (IBAction)emailPressed:(id)sender {
    if (![_directory.studentEmail isEqual:@""]) {
        NSArray *myArray = [NSArray arrayWithObjects:_directory.studentEmail, nil];
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

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller

                 didFinishWithResult:(MessageComposeResult)result

{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)messagePressed:(id)sender {
    if (![_directory.studentPhone  isEqual: @""]) {
        //NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"sms:", _directory.studentPhone];
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
        NSArray *myArray = [NSArray arrayWithObjects:_directory.studentPhone, nil];
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

- (IBAction)parentsMessagePressed:(id)sender {
    if (![_directory.homePhone  isEqual: @""]) {
        NSArray *myArray = [NSArray arrayWithObjects:_directory.homePhone, nil];
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

- (IBAction)homePhonePressed:(id)sender {
    if (![_directory.homePhone  isEqual: @""]) {
        NSString *phoneNum = [NSString stringWithFormat:@"%@%@", @"tel:", _directory.homePhone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
    }
}

- (IBAction)addressPressed:(id)sender {
    NSString *address = [NSString stringWithFormat:@"%@ %@", _directory.addressLine1, _directory.addressLine2];
    NSString *myString = [address stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSString* urlString = [NSString stringWithFormat:@"http://maps.apple.com/maps?q=%@", myString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}




@end
