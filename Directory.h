//
//  Directory.h
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Directory : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *grade;
@property (readonly) NSNumber *stuId;
@property (readonly) NSString *lastName;
@property (readonly) NSString *firstName;
@property (readonly) NSString *addrCode;
@property (readonly) NSString *parentsName;
@property (readonly) NSString *addressLine1;
@property (readonly) NSString *addressLine2;
@property (readonly) NSString *bday;
@property (readonly) NSString *homePhone;
@property (readonly) NSString *studentPhone;
@property (readonly) NSString *studentEmail;

@end
