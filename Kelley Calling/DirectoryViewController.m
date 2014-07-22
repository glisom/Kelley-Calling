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

@interface DirectoryViewController ()

@end

@implementation DirectoryViewController {
    NSArray *_info;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filteredResults = [NSMutableArray arrayWithCapacity:[_info count]];
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BishopKelley" withExtension:@"json"];
    
    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _info = [jsonLoader informationFromJSONFile:url];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
}

/*// Just before showing the LocationDetailViewController, set the selected Location object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LocationDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.location = [_locations objectAtIndex:indexPath.row];
}*/


#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    Directory *directory;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
         directory = [_filteredResults objectAtIndex:indexPath.row];
    } else {
         directory = [_info objectAtIndex:indexPath.row];
    }
    
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", directory.firstName, directory.lastName];
    cell.textLabel.text = fullname;
    
    cell.detailTextLabel.text = directory.grade;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_info count];
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredResults removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.firstName contains[c] %@",searchText];
    _filteredResults = [NSMutableArray arrayWithArray:[_info filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
