//
//  CommitteesDetailView.h
//  Kelley Calling
//
//  Created by Grant Isom on 9/14/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Committees.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CommitteesDetailView : UITableViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) Committees *commit;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *clubName;
@property (weak, nonatomic) IBOutlet UIButton *emailAddress;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@end
