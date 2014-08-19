//
//  Committees.h
//  Kelley Calling
//
//  Created by Grant Isom on 8/16/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Committees : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *committee;
@property (readonly) NSString *name;
@property (readonly) NSString *email;
@property (readonly) NSString *phone;

@end
