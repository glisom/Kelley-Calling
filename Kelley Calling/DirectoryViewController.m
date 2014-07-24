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
#import "DetailsViewController.h"

@interface DirectoryViewController ()

@end

@implementation DirectoryViewController {
    NSArray *searchResults;
    NSArray *info;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // create a mutable array to contain products for the search results table
    //self.searchResults = [NSMutableArray arrayWithCapacity:[self.info count]];
    
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BishopKelley" withExtension:@"json"];
    
    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        info = [jsonLoader informationFromJSONFile:url];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    
    [self.searchDisplayController.searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"LocationCell"];

}

// Just before showing the LocationDetailViewController, set the selected Location object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*DetailsViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = nil;
    if (self.searchDisplayController.active) {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        vc.directory = [searchResults objectAtIndex:indexPath.row];
    } else {
        indexPath = [self.tableView indexPathForCell:sender];
        vc.directory = [info objectAtIndex:indexPath.row];
    }*/
    
    
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
     
     DetailsViewController *destViewController = segue.destinationViewController;
     destViewController.directory = directory;
     }
    
}


#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LocationCell"];
    }
    
    Directory *directory = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        directory = [searchResults objectAtIndex:indexPath.row];
    } else {
        directory = [info objectAtIndex:indexPath.row];
    }
    
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", directory.firstName, directory.lastName];
    cell.textLabel.text = fullname;
    
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
    
    cell.detailTextLabel.text = grade;
    
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
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"_firstName contains[c] %@", searchText];
    searchResults = [info filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


@end
