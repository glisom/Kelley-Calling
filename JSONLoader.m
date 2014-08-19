//
//  JSONLoader.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "JSONLoader.h"
#import "Directory.h"
#import "Pto.h"
#import "BkClub.h"
#import "Committees.h"

@implementation JSONLoader

- (NSArray *)informationFromJSONFile:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray *directoryInfo = [[NSMutableArray alloc] init];
    
    NSArray *array = [jsonDictionary objectForKey:@"info"];
    for(NSDictionary *dict in array) {
        Directory *directory = [[Directory alloc] initWithJSONDictionary:dict];
        [directoryInfo addObject:directory];
    }
    
    return directoryInfo;
}

- (NSArray *)informationFromPTOFile:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray *directoryInfo = [[NSMutableArray alloc] init];
    
    NSArray *array = [jsonDictionary objectForKey:@"PTO"];
    for(NSDictionary *dict in array) {
        Pto *list = [[Pto alloc] initWithJSONDictionary:dict];
        [directoryInfo addObject:list];
    }
    
    return directoryInfo;
}

- (NSArray *)informationFromClubFile:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray *directoryInfo = [[NSMutableArray alloc] init];
    
    NSArray *array = [jsonDictionary objectForKey:@"bkclub"];
    for(NSDictionary *dict in array) {
        BkClub *list = [[BkClub alloc] initWithJSONDictionary:dict];
        [directoryInfo addObject:list];
    }
    
    return directoryInfo;
}

- (NSArray *)informationFromCommitteeFile:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray *directoryInfo = [[NSMutableArray alloc] init];
    
    NSArray *array = [jsonDictionary objectForKey:@"COMMITTEE"];
    for(NSDictionary *dict in array) {
        Committees *list = [[Committees alloc] initWithJSONDictionary:dict];
        [directoryInfo addObject:list];
    }
    
    return directoryInfo;
}

@end
