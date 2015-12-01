//
//  PersonStore.h
//  User
//
//  Created by elliott chavis on 11/24/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface PersonStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allPersons;

+ (instancetype)sharedStore;
- (Person *)createPerson;
- (void)removePerson:(Person *)person;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;


@end
