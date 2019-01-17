//
//  UILabel+Style.m
//  Shopping
//
//  Created by 邝子涵 on 2017/3/14.
//  Copyright © 2017年 鸿惠(上海)信息技术服务有限公司. All rights reserved.
//

#import "UILabel+Style.h"
#import <Masonry.h>

@implementation UILabel (Style)

- (void)attributedStrikethroughText:(NSString *)mainText withBlackText:(NSString *)blackText {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mainText];
    NSRange range = [mainText rangeOfString:blackText];

    [attributeString addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:range];
    
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle)  range:range];
    
    self.attributedText = attributeString;
}


- (void)attributedTwoBlackText:(NSString *)mainText
       withFirstBlackText:(NSString *)firstBlackText
      withSecondBlackText:(NSString *)secondBlackText {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mainText];
    NSRange range_first = [mainText rangeOfString:firstBlackText];
    NSRange range_second = [mainText rangeOfString:secondBlackText];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range_first];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range_second];
    self.attributedText = attributeString;
}



- (void)attributedColorWihtText:(NSString *)mainText
                  withColorText:(NSString *)colorText
                      withColor:(UIColor *)color{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mainText];
    NSRange range = [mainText rangeOfString:colorText];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size:17] range:range];
    self.attributedText = attributeString;
}

- (void)attributedFontWihtText:(NSString *)mainText
                  withColorText:(NSString *)colorText
                      withColor:(UIColor *)color
                       withFont:(UIFont *)font{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mainText];
    NSRange range = [mainText rangeOfString:colorText];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = attributeString;
}




+(UILabel *)getLabelWithFont:(UIFont *)font
                      textColor:(UIColor *)textColor
                      superView:(UIView *)superView
                     masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(label,make);
        }
    }];
    return label;
}


- (void)changeLabelHeightWithWidth:(CGFloat)witdh
{
    self.preferredMaxLayoutWidth = witdh;
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}
@end
