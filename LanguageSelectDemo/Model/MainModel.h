//
//  MainModel.h
//  demo
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 sunyn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainModel : NSObject
@property (nonatomic, strong) NSMutableArray *dataArray;
+(instancetype)MainModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
