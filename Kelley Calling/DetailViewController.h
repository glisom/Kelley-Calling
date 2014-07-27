//
//  DetailViewController.h
//  Kelley Calling
//
//  Created by Grant Isom on 7/26/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Directory.h"

@interface DetailViewController : UITableViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) Directory *directory;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *parentsName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *gradeLevel;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIButton *emailAddress;
@property (weak, nonatomic) IBOutlet UIButton *homePhone;
@property (weak, nonatomic) IBOutlet UIButton *AddressLine1;
@property (weak, nonatomic) IBOutlet UIButton *AddressLine2;

@end
