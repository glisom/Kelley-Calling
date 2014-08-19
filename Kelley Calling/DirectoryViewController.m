//
//  DirectoryViewController.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "DirectoryViewController.h"
#import "JSONLoader.h"
#import "Directory.h"
#import "DetailViewController.h"
#import "DirectoryViewCell.h"


@interface DirectoryViewController ()

@end

@implementation DirectoryViewController {
    NSArray *searchResults;
    NSArray *info;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BishopKelley" withExtension:@"json"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        info = [jsonLoader informationFromJSONFile:url];
       
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    
    [self.searchDisplayController.searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"LocationCell"];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"showInfoDetail"]) {
     NSIndexPath *indexPath = nil;
     Directory *directory = nil;
     
     if (self.searchDisplayController.active) {
     indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
     directory = [searchResults objectAtIndex:indexPath.row];
     } else {
     indexPath = [self.tableView indexPathForSelectedRow];
     directory = [info objectAtIndex:indexPath.row];
     }
     
     DetailViewController *destViewController = segue.destinationViewController;
     destViewController.directory = directory;
     }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}


#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"LocationCell";
    DirectoryViewCell *cell = (DirectoryViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[DirectoryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Directory *directory = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        directory = [searchResults objectAtIndex:indexPath.row];
    } else {
        directory = [info objectAtIndex:indexPath.row];
    }
    
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", directory.firstName, directory.lastName];
    cell.nameLabel.text = fullname;
    
    NSString *grade;
    if ([directory.grade isEqual:@"(9)"]) {
        grade = @"Freshman";
    } else if ([directory.grade isEqual:@"(10)"]) {
        grade = @"Sophomore";
    } else if ([directory.grade isEqual:@"(11)"]) {
        grade = @"Junior";
    } else {
        grade = @"Senior";
    }
    
    cell.gradeLabel.text = grade;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [info count];
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSString *text = searchText;
    NSString *searchiText = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSArray *array = [searchiText componentsSeparatedByString:@" "];
    NSString *firstName = searchiText;
    NSString *lastName = searchiText;
    NSPredicate *predicate = nil;
    
    if ([array count] > 1) {
        firstName = array[0];
        lastName = array[1];
        predicate = [NSPredicate predicateWithFormat:@"(firstName CONTAINS[cd] %@ AND lastName CONTAINS[cd] %@) OR (firstName CONTAINS[cd] %@ AND lastName CONTAINS[cd] %@)", firstName, lastName, lastName, firstName];
    } else {
        predicate = [NSPredicate predicateWithFormat:@"firstName CONTAINS[cd] %@ OR lastName CONTAINS[cd] %@", firstName, lastName];
    }
    
    searchResults = [info filteredArrayUsingPredicate:predicate];
    NSLog(@"%@", searchResults);
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}


@end
