//
//  JSONLoader.h
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONLoader : NSObject

- (NSArray *)informationFromJSONFile:(NSURL *)url;
- (NSArray *)informationFromPTOFile:(NSURL *)url;
- (NSArray *)informationFromClubFile:(NSURL *)url;
- (NSArray *)informationFromCommitteeFile:(NSURL *)url;


@end
