//
//  DetailsViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _navBar.title = _directory.firstName;
    _firstName.text = _directory.firstName;
    _lastName.text = _directory.lastName;
    _AddressLine1.text = _directory.addressLine1;
    _AddressLine2.text = _directory.addressLine2;
    _phoneNumber.text = _directory.studentPhone;
    _emailAddress.text = _directory.studentEmail;
    _parentsName.text = _directory.parentsName;
    _HomePhone.text = _directory.homePhone;
    _birthday.text = _directory.bday;
    _gradeLevel.text = _directory.grade;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
