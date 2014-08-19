//
//  BkClub.h
//  Kelley Calling
//
//  Created by Grant Isom on 8/16/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BkClub : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *club;
@property (readonly) NSString *name;
@property (readonly) NSString *email;
@property (readonly) NSString *phone;


@end
