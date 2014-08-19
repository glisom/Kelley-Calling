//
//  Pto.m
//  Kelley Calling
//
//  Created by Grant Isom on 8/16/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "Pto.h"

@implementation Pto

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _position = [jsonDictionary objectForKey:@"POSITION"];
        _name = [jsonDictionary objectForKey:@"NAME"];
        _email = [jsonDictionary objectForKey:@"EMAIL"];
        _phone = [jsonDictionary objectForKey:@"PHONE"];
        
    }
    
    return self;
}


@end
