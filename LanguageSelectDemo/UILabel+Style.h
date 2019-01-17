//
//  UILabel+Style.h
//  Shopping
//
//  Created by 邝子涵 on 2017/3/14.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
@interface UILabel (Style)


/**
 富文本-删除线

 @param mainText 全部文本
 @param blackText 下划线文本
 */
- (void)attributedStrikethroughText:(NSString *)mainText withBlackText:(NSString *)blackText;



/**
 富文本-两个标题文字变灰

 @param mainText 全部文本
 @param firstBlackText 第一个黑色文字
 @param secondBlackText 第二个黑色文字
 */
- (void)attributedTwoBlackText:(NSString *)mainText
            withFirstBlackText:(NSString *)firstBlackText
           withSecondBlackText:(NSString *)secondBlackText;



/**
 富文本-文字变色

 @param mainText 全部文本
 @param colorText 变色文字
 @param color 颜色
 */
- (void)attributedColorWihtText:(NSString *)mainText
                  withColorText:(NSString *)colorText
                      withColor:(UIColor *)color;



/**
 富文本-文字变色
 
 @param mainText 全部文本
 @param colorText 变色文字
 @param color 颜色
 @param font 字体
 */
- (void)attributedFontWihtText:(NSString *)mainText
                 withColorText:(NSString *)colorText
                     withColor:(UIColor *)color
                      withFont:(UIFont *)font;



/**
 label布局masonry
 */
+(UILabel *)getLabelWithFont:(UIFont *)font
                   textColor:(UIColor *)textColor
                   superView:(UIView *)superView
                  masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;


/**
 * masonry自适应高度
 */
- (void)changeLabelHeightWithWidth:(CGFloat)witdh;

/**
 设置文本,并指定行间距
 
 @param text 文本内容
 @param lineSpacing 行间距
 */
-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
@end
