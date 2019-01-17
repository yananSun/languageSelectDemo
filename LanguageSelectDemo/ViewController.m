//
//  ViewController.m
//  LanguageSelectDemo
//
//  Created by sunyn on 2019/1/16.
//  Copyright © 2019年 sunyn. All rights reserved.
//

#import "ViewController.h"
#import "LanguageModel.h"
#import "MainModel.h"
#import "HDLanguageCell.h"
#import <Masonry.h>


// 获取屏幕 宽、高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.navT;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"language" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    //转Model
    MainModel *mol = [MainModel MainModelWithDict:dict];
    [self.dataArr  addObjectsFromArray:mol.dataArray];
    [self createTableView];
    
}
- (void)createTableView {
    _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _myTableView.backgroundColor = [UIColor whiteColor];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if ([self.navT isEqualToString:@"源语言"]) {
        _myTableView.tableHeaderView = [self tableViewHeader];
    }
    _myTableView.sectionIndexColor = [UIColor blackColor];
    [self.view addSubview:_myTableView];
    [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop).offset(0);
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LanguageModel *model = [self.dataArr objectAtIndex:section];
    return model.detailArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HDLanguageCell *cell = [HDLanguageCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LanguageModel *model = [self.dataArr objectAtIndex:indexPath.section];
    cell.mainLabel.text = [[[model.detailArray objectAtIndex:indexPath.row] componentsSeparatedByString:@","]firstObject];
    if (indexPath.section == 0) {
        cell.contentLabel.hidden = NO;
        switch (indexPath.row) {
            case 0:{
                cell.contentLabel.text = @"支持语音识别、拍照识别、拼音注释";
            }
                break;
            case 1:{
                cell.contentLabel.text = @"支持语音识别、拍照识别";
            }
                break;
            case 2:{
                cell.contentLabel.text = @"支持拍照识别、假名注释";
            }
                break;
                
        }
    }else {
        cell.contentLabel.hidden = YES;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LanguageModel *model = [self.dataArr objectAtIndex:indexPath.section];
    if (self.clickAutoHandler) {
        self.clickAutoHandler([model.detailArray objectAtIndex:indexPath.row]);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LanguageModel *model = [self.dataArr objectAtIndex:section];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor  = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.text = model.sectionName;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.offset(0);
    }];
    return view;
}

- (UIView *)tableViewHeader {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];;
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(16, 0, SCREEN_WIDTH, 50);
    label.text = @"自动检测";
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor blackColor];
    [headerView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH - 15+20, 15, 20, 20);
    [btn setImage:[UIImage imageNamed:@"xuanze-2"] forState:normal];
    [btn setImage:[UIImage imageNamed:@"xuanze-1"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(automaticBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    
    if ([self.selectStr isEqualToString:@"自动检测"]) {
        btn.selected = YES;
    } else {
        btn.selected = NO;
    }
    return headerView;
    
}


#pragma mark ---- 自动检测 ----
-(void)automaticBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.clickAutoHandler) {
        self.clickAutoHandler(@"自动检测");
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/** 右侧索引列表*/
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *titleName = [NSMutableArray array];
    for (LanguageModel *model in self.dataArr) {
        if (![model.sectionName isEqualToString:@"常用语言"]) {
            [titleName addObject:model.sectionName];
        }
    }
    return titleName;
}


@end
