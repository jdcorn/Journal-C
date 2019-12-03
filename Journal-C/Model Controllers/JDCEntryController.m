//
//  JDCEntryController.m
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import "JDCEntryController.h"

static NSString * const EntriesKey = @"entries";

@interface JDCEntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation JDCEntryController

// Shared Instance properites (code snippet)
+ (JDCEntryController *) shared
{
    static JDCEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [JDCEntryController new];
    });
    return shared;
}

// Properties
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (JDCEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        JDCEntry *entry = [[JDCEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(JDCEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(JDCEntry *)entry
{
    [self.internalEntries removeObject:entry];
}


@end
