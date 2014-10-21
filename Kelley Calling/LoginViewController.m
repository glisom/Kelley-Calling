//
//  LoginViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/28/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "LoginViewController.h"
#import "DirectoryViewController.h"

@interface LoginViewController ()
- (IBAction)backgroundClick:(id)sender;
@end

@implementation LoginViewController {
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
       [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)backgroundClick:(id)sender {
    [_textField resignFirstResponder];
}

- (IBAction)loginPressed:(id)sender {
    if ([_textField.text  isEqual: @"BKHS2014"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LoggedIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        DirectoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Directory"];
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]   initWithTitle:@"Incorrect Code"
                                                          message:@"Try Again"
                                                         delegate:self
                                                cancelButtonTitle:@"Okay"
                                                otherButtonTitles: nil];
        [alert show];
        _textField.text = nil;
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    //Keyboard becomes visible
    self.loginView.frame = CGRectMake(self.loginView.frame.origin.x,
                                  self.loginView.frame.origin.y,
                                  self.loginView.frame.size.width,
                                  self.loginView.frame.size.height - 215 + 50);   //resize
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    //keyboard will hide
    self.loginView.frame = CGRectMake(self.loginView.frame.origin.x,
                                  self.loginView.frame.origin.y,
                                  self.loginView.frame.size.width,
                                  self.loginView.frame.size.height + 215 - 50); //resize
}

@end
