//
//  JSONLoader.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "JSONLoader.h"
#import "Directory.h"

@implementation JSONLoader

- (NSArray *)informationFromJSONFile:(NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the info
    NSMutableArray *directoryInfo = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "directory items"
    NSArray *array = [jsonDictionary objectForKey:@"info"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        // Create a new Location object for each one and initialise it with information in the dictionary
        Directory *directory = [[Directory alloc] initWithJSONDictionary:dict];
        // Add the Location object to the array
        [directoryInfo addObject:directory];
    }
    
    // Return the array of Location objects
    return directoryInfo;
}

@end
