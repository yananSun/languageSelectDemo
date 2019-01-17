//
//  UIView+Style.h
//  Shopping
//
//  Created by 邝子涵 on 2017/3/13.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
typedef NS_ENUM(NSInteger, UIBorderSideType) {
    UIBorderSideTypeAll    = 0,
    UIBorderSideTypeTop    = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft   = 1 << 2,
    UIBorderSideTypeRight  = 1 << 3,
};

@interface UIView (Style)
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGSize size;
@property(nonatomic, assign)CGPoint origin;
@property(nonatomic, assign)CGFloat centerX;
@property(nonatomic, assign)CGFloat centerY;
- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
// 长线
- (void)addLongLine:(CGFloat)y;
// 短线
- (void)addLine:(CGFloat)y;

// 添加白色短线
- (void)addWhiteLine:(CGFloat)y;



// 设置圆角
- (void)borderViewStyleWithCornerRadius:(CGFloat)cornerRadius withColor:(UIColor *)color;

// 设置阴影
- (void)borderViewShadowColorWithCornerRadius:(CGFloat)cornerRadius withShadowColor:(UIColor *)color withShadowOffset:(CGSize)sizeMake;

// 绘图圆角
+ (CAShapeLayer *)changeMaskLayerWithRect:(CGRect)rect with:(CGSize)make withCorners:(UIRectCorner)corners;

// 画线
+ (UIBezierPath *)addPathWithMove:(CGPoint)move withAddLine:(CGPoint)addLine;

- (void)changeViewAnimationWithDuration:(CFTimeInterval)duration;

- (void)setViewGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor;
/**
 布局
 */
+(UIView *)getViewWithColor:(UIColor *)color
                  superView:(UIView *)superView
                 masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block;

@end
