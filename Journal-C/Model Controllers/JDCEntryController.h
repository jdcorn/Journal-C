//
//  JDCEntryController.h
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDCEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDCEntryController : NSObject

// Source of Truth
// Add an entries NSArray
@property (nonatomic, strong) NSArray *entries;

// CRUD
// Create two methods that add and remove entries
- (void)addEntry:(JDCEntry *)entry;
- (void)removeEntry:(JDCEntry *)entry;

// Shared Instance
// Create shared instance of JDCEntryController
+(JDCEntryController *) shared;

@end

NS_ASSUME_NONNULL_END
