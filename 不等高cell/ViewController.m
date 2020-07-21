//
//  ViewController.m
//  不等高cell
//
//  Created by s on 2020/7/21.
//  Copyright © 2020 s. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "MSIStatus.h"
#import "MSIStatusCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong) NSArray *statuses;
@end


@implementation ViewController


-(NSArray *)statuses{
    if(_statuses == nil) {
        _statuses = [MSIStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
    
}

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabView.dataSource = self;
    self.tabView.delegate = self;
    [self.tabView registerClass:[MSIStatusCell class] forCellReuseIdentifier:ID];
    self.tabView.rowHeight= 250;
    // Do any additional setup after loading the view.
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//     访问缓存池
    MSIStatusCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    cell.status = self.statuses[indexPath.row];
    return cell;

}
@end
