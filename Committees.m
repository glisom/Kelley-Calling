//
//  Committees.m
//  Kelley Calling
//
//  Created by Grant Isom on 8/16/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "Committees.h"

@implementation Committees

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _committee = [jsonDictionary objectForKey:@"COMMITTEE"];
        _name = [jsonDictionary objectForKey:@"NAME"];
        _email = [jsonDictionary objectForKey:@"EMAIL"];
        _phone = [jsonDictionary objectForKey:@"PHONE"];
        
    }
    
    return self;
}

@end
