//
//  JDCEntry.h
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDCEntry : NSObject

//MARK: - Properties
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *timestamp;

// MARK: - Initializer
- (instancetype) initWithTitle: (NSString *)title
                         body: (NSString *)body
                    timestamp: (NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
