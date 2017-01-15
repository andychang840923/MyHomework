//
//  OrderTableView.m
//  test
//
//  Created by Andy Chang on 17/1/14.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import "OrderTableView.h"

@interface OrderTableView ()

@end
@implementation OrderTableView
extern  NSMutableArray *orderlist;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //orderlist = [[NSMutableArray alloc] init];
    
    _ordertable.refreshControl= [UIRefreshControl new];
    [_ordertable.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [orderlist count];
}

-(void) viewDidAppear:(BOOL)animated{
    _ordertable.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"更新中..." ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=[[orderlist objectAtIndex:indexPath.row] objectAtIndex:0];
    // cell.rightLabel.text=[[list objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [orderlist removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/data/orderlist.txt"];
    [orderlist writeToFile:path atomically:YES];
    
}




-(void)handleRefresh{
    [NSThread sleepForTimeInterval:2.0];
    [_ordertable.refreshControl endRefreshing];
    [self.ordertable reloadData];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
