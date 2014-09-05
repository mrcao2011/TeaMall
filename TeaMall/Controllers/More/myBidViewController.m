//
//  myBidViewController.m
//  TeaMall
//
//  Created by Carl_Huang on 14-9-5.
//  Copyright (c) 2014年 helloworld. All rights reserved.
//

#import "myBidViewController.h"
#import "HttpService.h"
#import "User.h"
#import "Bid.h"
#import "BidCell.h"
#import "MBProgressHUD.h"

static NSString *cellID = @"cellID";

@interface myBidViewController ()

{
    NSArray *_bidList;//拍下列表
}

@end

@implementation myBidViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我拍下的";
    [self setLeftCustomBarItem:@"返回" action:nil];
    UINib * bidCellNib = [UINib nibWithNibName:@"BidCell" bundle:[NSBundle bundleForClass:[BidCell class]]];
    [self.contentTable registerNib:bidCellNib forCellReuseIdentifier:cellID];
    self.contentTable.rowHeight = 206.0;
    
    //加载数据
    [self loadData];
}

#pragma mark 加载模型数据
- (void)loadData
{
    User *user = [User userFromLocal];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"加载中...";
    [[HttpService sharedInstance] getBidList:@{@"user_id":user.hw_id,@"page":@"1",@"pageSize":@"15"} completionBlock:^(id object) {
        _bidList = (NSArray *)object;
        [_contentTable reloadData];
        [hud hide:YES afterDelay:1];
    } failureBlock:^(NSError *error, NSString *responseString) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"暂时没有数据";
        [hud hide:YES afterDelay:1];
    }];
}

#pragma mark TableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _bidList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BidCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    Bid *bid = _bidList[indexPath.row];
    [cell setBid:bid];
    return cell;
}
@end