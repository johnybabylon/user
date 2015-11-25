//
//  Person.m
//  User
//
//  Created by Johny Babylon on 11/24/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)randomPerson
{
    NSArray *randomNameList = @[@"Steve Jobs", @"Bill Gates", @"Mark Zuckerburg"];
    NSArray *randomPhoneList = @[@"415-876-0098", @"510-332-4784", @"415-514-2322"];
    
    NSInteger nameIndex = arc4random() % [randomNameList count];
    NSInteger phoneIndex = arc4random() % [randomPhoneList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@", [randomNameList objectAtIndex:nameIndex]];
    NSString *randomPhone = [NSString stringWithFormat:@"%@", [randomPhoneList objectAtIndex:phoneIndex]];
                                                     
    Person *person = [[self alloc] initWithPersonName:randomName
                                    personPhone:randomPhone];
                                                     
                                                     return person;
}

- (instancetype)initWithPersonName:(NSString *)name
                       personPhone:(NSString *)phone
{
    self = [super init];
    
    if (self) {
        _personName = name;
        _personPhone = phone;
        _dateCreated = [[NSDate alloc] init];
        
    }
    return self;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@) created on %@",
                                   self.personName,
                                   self.personPhone,
                                   self.dateCreated];
    return descriptionString;
}

- (void)setPersonName:(NSString *)str
{
    _personName = str;
}
- (NSString *)personName
{
    return _personName;
}

- (void)setPersonPhone:(NSString *)str
{
    _personPhone = str;
}
- (NSString *)personPhone
{
    return _personPhone;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

@end
