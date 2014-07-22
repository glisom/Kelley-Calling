//
//  Directory.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/22/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "Directory.h"

@implementation Directory

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _grade = [jsonDictionary objectForKey:@"Grade"];
        _stuId = [jsonDictionary objectForKey:@"ID"];
        _lastName = [jsonDictionary objectForKey:@"STU_LAST_NAME"];
        _firstName = [jsonDictionary objectForKey:@"STU_PREFERRED_NAME"];
        _addrCode = [jsonDictionary objectForKey:@"ADDR_CODE"];
        _parentsName = [jsonDictionary objectForKey:@"Parents_Name"];
        _addressLine1 = [jsonDictionary objectForKey:@"ADDR"];
        _addressLine2 = [jsonDictionary objectForKey:@"ADDR_CityStateZip"];
        _bday = [jsonDictionary objectForKey:@"Bday"];
        _homePhone = [jsonDictionary objectForKey:@"Home_Num"];
        _studentPhone = [jsonDictionary objectForKey:@"Student_Phone"];
        _studentEmail = [jsonDictionary objectForKey:@"STU_EMAIL"];
    }
    
    return self;
}


@end
