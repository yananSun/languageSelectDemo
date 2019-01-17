//
//  ViewController.h
//  LanguageSelectDemo
//
//  Created by sunyn on 2019/1/16.
//  Copyright © 2019年 sunyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, copy) NSString *navT;
@property (nonatomic, copy) NSString *selectStr;
@property (nonatomic, copy) void (^clickAutoHandler)(NSString *selectStr);
@end

