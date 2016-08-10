//
//  DMPicModel.m
//  DMPicCarouselDemo
//
//  Created by demin on 16/8/9.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "DMPicModel.h"

@implementation DMPicModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
