//
//  ExtensionsViewController.h
//  Kelley Calling
//
//  Created by Grant Isom on 9/14/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtensionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (void)loadRequestFromString:(NSString*)urlString;
@end
