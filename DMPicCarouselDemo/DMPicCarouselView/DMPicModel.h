//
//  DMPicModel.h
//  DMPicCarouselDemo
//
//  Created by demin on 16/8/9.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMPicModel : NSObject

/**
 *  网络图片链接
 */
@property (nonatomic, copy) NSString *picUrl;

/**
 *  本地图片名称
 */
@property (nonatomic, copy) NSString *picName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
