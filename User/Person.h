//
//  Person.h
//  User
//
//  Created by Johny Babylon on 11/24/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_personName;
    NSString  *_personPhone;
    NSDate *_dateCreated;
}

+ (instancetype)randomPerson;

- (instancetype)initWithPersonName:(NSString *)name
                       personPhone:(NSString *)phone;

- (instancetype)initWithpersonName:(NSString *)name;


- (void)setPersonName:(NSString *)str;
- (NSString *)personName;

- (void)setPersonPhone:(NSString *)str;
- (NSString *)personPhone;

- (NSDate *)dateCreated;



@end