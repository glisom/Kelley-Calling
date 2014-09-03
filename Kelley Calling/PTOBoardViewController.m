//
//  PTOBoardViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 8/30/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "PTOBoardViewController.h"
#import "JSONLoader.h"
#import "Pto.h"
#import "PTODetailViewController.h"
#import "PTOViewCell.h"


@interface PTOBoardViewController ()

@end

@implementation PTOBoardViewController {
    NSArray *info;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"pto" withExtension:@"json"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        info = [jsonLoader informationFromPTOFile:url];
        
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    
    [self.searchDisplayController.searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"PTOCell"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPTODetail"]) {
        NSIndexPath *indexPath = nil;
        Pto *pto = nil;
        
        indexPath = [self.tableView indexPathForSelectedRow];
        pto = [info objectAtIndex:indexPath.row];
        
        PTODetailViewController *destViewController = segue.destinationViewController;
        destViewController.pto = pto;
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
    
    static NSString *CellIdentifier = @"PTOCell";
    PTOViewCell *cell = (PTOViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[PTOViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Pto *pto = nil;
    
    pto = [info objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = pto.name;
    
    NSString *position;
    if ([pto.position isEqual:@"PRESIDENT:"]) {
        position = @"President";
    } else if ([pto.position isEqual:@"PAST PRESIDENT:"]) {
        position = @"Past President";
    } else if ([pto.position isEqual:@"PRESIDENT-ELECT:"]) {
        position = @"President Elect";
    } else if ([pto.position isEqual:@"SECRETARY:"]) {
        position = @"Secretary";
    } else {
        position = @"Treasurer";
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
