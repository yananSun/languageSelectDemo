//
//  LanguageModel.h
//  demo
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 sunyn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanguageModel : NSObject
@property (nonatomic, copy) NSString *sectionName;
@property (nonatomic, strong) NSMutableArray *detailArray;

+(instancetype)LanguageModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
