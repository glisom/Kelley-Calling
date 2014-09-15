//
//  BkClubViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 9/14/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "BkClubViewController.h"
#import "JSONLoader.h"
#import "BkClub.h"
#import "BkClubDetailViewController.h"
#import "BkClubTableViewCell.h"

@interface BkClubViewController ()

@end

@implementation BkClubViewController{
    NSArray *info;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bkclub" withExtension:@"json"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        info = [jsonLoader informationFromClubFile:url];
        
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    
    [self.searchDisplayController.searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"BKClubCell"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBKClubDetail"]) {
        NSIndexPath *indexPath = nil;
        BkClub *club = nil;
        
        indexPath = [self.tableView indexPathForSelectedRow];
        club = [info objectAtIndex:indexPath.row];
        
        BkClubDetailViewController *destViewController = segue.destinationViewController;
        destViewController.club = club;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"BKClubCell";
    BkClubTableViewCell *cell = (BkClubTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[BkClubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    BkClub *club = nil;
    
    club = [info objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = club.name;
    
    NSString *position;
    if ([club.club isEqual:@"BK CLUB '15"]) {
        position = @"BK Club '15";
    } else if ([club.club isEqual:@"BK CLUB '16"]) {
        position = @"BK Club '16";
    } else if ([club.club isEqual:@"BK CLUB '17"]) {
        position = @"BK Club '17";
    } else {
        position = @"BK Club '18";
    }
    
    cell.PostionLabel.text = position;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [info count];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

@end
