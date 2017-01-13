//
//  ItemTableView.m
//  test
//
//  Created by Andy Chang on 17/1/13.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import "ItemTableView.h"
#import "CustemCellItem.h"
@interface ItemTableView ()

@end

@implementation ItemTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    list = [[NSMutableArray alloc] init];
    [list addObject:[NSArray arrayWithObjects:@"牙膏",@"1" ,nil]];
    [list addObject:[NSArray arrayWithObjects:@"牙刷",@"2", nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    CustemCellItem *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"CustemCellItem" owner:nil options:nil];
        for(UIView *view in views){
            if([view isKindOfClass:[CustemCellItem class]]){
                cell = (CustemCellItem*)view;
            }
        }
    }
    cell.leftLabel.text=[[list objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.rightLabel.text=[[list objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [list removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
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
