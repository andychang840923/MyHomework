//
//  ItemTableView.m
//  test
//
//  Created by Andy Chang on 17/1/13.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import "ItemTableView.h"


@interface ItemTableView ()

@end

@implementation ItemTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    list = [[NSMutableArray alloc] init];
    orderlist = [[NSMutableArray alloc] init];
    _itemTable.refreshControl= [UIRefreshControl new];
    [_itemTable.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    NSFileManager *fm=[NSFileManager defaultManager];
    NSString *dir = [NSHomeDirectory() stringByAppendingString:@"/Documents/data"];
    NSString *file = [dir stringByAppendingString:@"/itemlist.txt"];
    NSError *error = nil;
    BOOL isExist=[NSHomeDirectory() stringByAppendingString:@"/Documents/data/itemlist.txt"];
    if(!isExist){
        BOOL success = [fm createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
    
        if(success){
            NSLog(@"目录建造成功");
        }else {
            NSLog(@"目录建立失败");
        }
    NSString *path=[NSHomeDirectory() stringByAppendingString:@"/Documents/data/orderlist.txt"];
        success = [fm createFileAtPath:file contents:nil attributes:nil];
        BOOL success2 = [fm createFileAtPath:path contents:nil attributes:nil];
        if(success&&success2){
            NSLog(@"文件建造成功");
        }else {
            NSLog(@"文件建立失败");
        }
    }else{
        NSLog(@"文件已存在");
       /* NSString *text = [[NSString alloc]initWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];*/
        list = [[NSMutableArray alloc] initWithContentsOfFile:file];
        if(list==nil){
           list = [[NSMutableArray alloc] init];
        }
        orderlist = [[NSMutableArray alloc]initWithContentsOfFile:file];
        if(orderlist==nil){
            orderlist = [[NSMutableArray alloc] init];
        }
        NSLog(@"%@",list);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [list count];
}

-(void) viewDidAppear:(BOOL)animated{
   _itemTable.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"更新中..." ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=[[list objectAtIndex:indexPath.row] objectAtIndex:0];
   // cell.rightLabel.text=[[list objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [list removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/data/itemlist.txt"];
    [list writeToFile:path atomically:YES];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    currentChoice=[indexPath row];
}

-(void)handleRefresh{
    [NSThread sleepForTimeInterval:2.0];
    [_itemTable.refreshControl endRefreshing];
    [self.itemTable reloadData];
    
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
