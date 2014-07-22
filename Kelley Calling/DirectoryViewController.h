//
//  DirectoryViewController.h
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *contactSearchBar;
@property (strong,nonatomic) NSMutableArray *filteredResults;

@end
