//
//  LanguageModel.m
//  demo
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 sunyn. All rights reserved.
//

#import "LanguageModel.h"

@implementation LanguageModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if(self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]) {
            self.sectionName = dict[@"sectionName"];
            if ([dict[@"detailArray"] isKindOfClass:[NSArray class]]) {
                self.detailArray = dict[@"detailArray"];
            }
        }
    }
    return self;
}

+(instancetype)LanguageModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
