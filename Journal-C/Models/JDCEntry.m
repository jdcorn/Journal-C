//
//  JDCEntry.m
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import "JDCEntry.h"

static NSString * const TitleKey = @"title";
static NSString * const BodyKey = @"body";
static NSString * const TimestampKey = @"timestamp";


@implementation JDCEntry

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *body = dictionary[BodyKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title body:body timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             BodyKey: self.body,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object

{
        if (![object isKindOfClass:[JDCEntry class]]) { return NO; }
        // Shortcut to comparing all properties one by one. We let NSDictionary do it for us
        return [[self dictionaryRepresentation] isEqualToDictionary:[(JDCEntry *)object dictionaryRepresentation]];
}

@end
