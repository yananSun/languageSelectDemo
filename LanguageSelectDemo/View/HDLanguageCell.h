//
//  HDLanguageCell.h
//  iosTextTranslation
//
//  Created by 胡正康 on 2018/12/23.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDLanguageCell : UITableViewCell

@property (nonatomic, weak) UILabel *mainLabel;
@property (nonatomic, weak) UILabel *contentLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
