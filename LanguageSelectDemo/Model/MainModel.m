//
//  MainModel.m
//  demo
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 sunyn. All rights reserved.
//

#import "MainModel.h"
#import "LanguageModel.h"
@implementation MainModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if(self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]) {
            if ([dict[@"dataArray"] isKindOfClass:[NSArray class]]) {
                self.dataArray = [[NSMutableArray alloc]init];
                for (NSDictionary *modelDict in dict[@"dataArray"]) {
                    LanguageModel *languageModel= [LanguageModel LanguageModelWithDict:modelDict];
                    [self.dataArray addObject:languageModel];
                }
            }
        }
    }
    return self;
}

+(instancetype)MainModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
