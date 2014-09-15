//
//  CommitteesViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 9/14/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "CommitteesViewController.h"
#import "JSONLoader.h"
#import "Committees.h"
#import "CommitteesDetailView.h"
#import "CommitteesTableViewCell.h"

@interface CommitteesViewController ()

@end

@implementation CommitteesViewController{
    NSArray *info;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"committees" withExtension:@"json"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        info = [jsonLoader informationFromCommitteeFile:url];
        
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    
    [self.searchDisplayController.searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CommitteesViewCell"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCommitteesDetail"]) {
        NSIndexPath *indexPath = nil;
        Committees *commit = nil;
        
        indexPath = [self.tableView indexPathForSelectedRow];
        commit = [info objectAtIndex:indexPath.row];
        
        CommitteesDetailView *destViewController = segue.destinationViewController;
        destViewController.commit = commit;
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
    
    static NSString *CellIdentifier = @"CommitteesViewCell";
    CommitteesTableViewCell *cell = (CommitteesTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[CommitteesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Committees *commit= nil;
    
    commit = [info objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = commit.name;
    
    cell.PostionLabel.text = commit.committee;
    
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
