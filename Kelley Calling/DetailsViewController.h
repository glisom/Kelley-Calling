//
//  DetailsViewController.h
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Directory.h"

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) Directory *directory;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *AddressLine1;
@property (weak, nonatomic) IBOutlet UILabel *AddressLine2;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *emailAddress;
@property (weak, nonatomic) IBOutlet UILabel *parentsName;
@property (weak, nonatomic) IBOutlet UILabel *HomePhone;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *gradeLevel;

@end
