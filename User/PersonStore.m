//
//  PersonStore.m
//  User
//
//  Created by elliott chavis on 11/24/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "PersonStore.h"
#import "Person.h"

@interface PersonStore ()

@property (nonatomic) NSMutableArray *privatePersons;

@end

@implementation PersonStore

+ (instancetype)sharedStore
{
    static PersonStore *sharedStore;
    
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
    
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[PersonStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self){
        _privatePersons = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allPersons
{
    
    return [self.privatePersons copy];
}

- (Person *)createPerson
{
    Person *person = [Person randomPerson];
    
    [self.privatePersons addObject:person];
    
    return person;
}

- (void)removePerson:(Person *)person
{
    [self.privatePersons removeObjectIdenticalTo:person];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex){
        return;
    }
    
    Person *person = self.privatePersons[fromIndex];
    
    [self.privatePersons removeObjectAtIndex:fromIndex];
    
    [self.privatePersons insertObject:person atIndex:toIndex];
}

@end




















