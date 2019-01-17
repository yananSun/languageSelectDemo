//
//  HDLanguageCell.m
//  iosTextTranslation
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import "HDLanguageCell.h"
#import "UILabel+Style.h"
#import "UIView+Style.h"
#import <Masonry.h>
@implementation HDLanguageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"HDLanguageCell";
    HDLanguageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HDLanguageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *mainLabel = [UILabel getLabelWithFont:[UIFont systemFontOfSize:15] textColor:[UIColor grayColor] superView:self.contentView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.offset(0);
    }];
    
    
    self.mainLabel = mainLabel;
    
    UILabel *contentLabel = [UILabel getLabelWithFont:[UIFont systemFontOfSize:13] textColor:[UIColor grayColor] superView:self.contentView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.equalTo(self.mainLabel.mas_right).offset(11);
        make.centerY.equalTo(self.mainLabel.mas_centerY);
    }];
    self.contentLabel = contentLabel;
    
//    [UIView getViewWithColor:C_EEEEEE superView:self.contentView masonrySet:^(UIView *view, MASConstraintMaker *make) {
//        make.left.offset(AD_HEIGHT(15));
//        make.bottom.right.offset(0);
//        make.height.mas_equalTo(AD_HEIGHT(1));
//    }];
}
@end
