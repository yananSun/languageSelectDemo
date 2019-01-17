//
//  UIView+Style.m
//  Shopping
//
//  Created by 邝子涵 on 2017/3/13.
//  Copyright © 2017年 鸿惠(上海)信息技术服务有限公司. All rights reserved.
//

#import "UIView+Style.h"
#import <Masonry.h>
// 设置颜色RGB
#define RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define C_Line RGBA(240, 240, 240, 1)

// 获取屏幕 宽、高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation UIView (Style)
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size
{
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}

-(CGFloat)centerY
{
    return self.center.y;
}

- (void)borderViewStyleWithCornerRadius:(CGFloat)cornerRadius withColor:(UIColor *)color {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = color.CGColor;
}


- (void)borderViewShadowColorWithCornerRadius:(CGFloat)cornerRadius withShadowColor:(UIColor *)color withShadowOffset:(CGSize)sizeMake {
    CALayer *layer = [CALayer layer];
    layer.frame = self.frame;
    layer.backgroundColor = color.CGColor;
    layer.shadowOffset = sizeMake;
    layer.shadowOpacity = 0.7;
    layer.cornerRadius = 10;
    //这里self表示当前自定义的view
    [self.layer addSublayer:layer];
    
    
    // self.layer.masksToBounds =YES;
}

/*
_imageView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
_imageView.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
_imageView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
_imageView.layer.shadowRadius = 4;//阴影半径，默认3
*/

- (void)addLongLine:(CGFloat)y{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = C_Line;
    [self addSubview:lineView];
}


- (void)addLine:(CGFloat)y{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, y, SCREEN_WIDTH - 10, 0.5)];
    lineView.backgroundColor = C_Line;
    [self addSubview:lineView];
}

- (void)addWhiteLine:(CGFloat)y{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, y, SCREEN_WIDTH - 40, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineView];
}


+ (CAShapeLayer *)changeMaskLayerWithRect:(CGRect)rect with:(CGSize)make withCorners:(UIRectCorner)corners {
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                    byRoundingCorners:corners
                                                          cornerRadii:make];
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.frame  = rect;
    maskLayer.path   = maskPath.CGPath;
    return maskLayer;
}

+ (UIBezierPath *)addPathWithMove:(CGPoint)move withAddLine:(CGPoint)addLine {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:move];
    [path addLineToPoint:addLine];
    return path;
}


#pragma mark - 点击视图放大动画
- (void)changeViewAnimationWithDuration:(CFTimeInterval)duration {
    CATransition *animation = [[CATransition alloc] init];
    animation.type = kCATransitionFade;
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:nil];
}

//MARK:view快速布局
+(UIView *)getViewWithColor:(UIColor *)color
                  superView:(UIView *)superView
                 masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(view,make);
        }
    }];
    return view;
}

- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        originalView.layer.borderWidth = borderWidth;
        originalView.layer.borderColor = color.CGColor;
        return originalView;
    }
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(0.0f, 0.0f)];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [bezierPath moveToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    
    [originalView.layer addSublayer:shapeLayer];
    
    return originalView;
    
}

- (void)setViewGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor
{
    //渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,  (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}
@end
