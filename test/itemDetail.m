//
//  itemDetail.m
//  test
//
//  Created by Andy Chang on 17/1/13.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import "itemDetail.h"
//#import "Constant.h"
@interface itemDetail ()

@end

@implementation itemDetail
extern NSMutableArray *list;
extern NSMutableArray *orderlist;
extern NSInteger currentChoice;

- (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}

- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
  //  [dateFormatter release];
    
    return destDate;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@",[list objectAtIndex:currentChoice]);
    _Name.text=[[list objectAtIndex:currentChoice] objectAtIndex:0];
    _Num.text=[[list objectAtIndex:currentChoice]  objectAtIndex:1];
    _Price.text=[[list objectAtIndex:currentChoice] objectAtIndex:2];
    
    NSDate *selected = [_Date date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    NSLog(@"%@",destDateString);
    NSLog(@"%@",_Date.date);
    NSDate*inputDate = [dateFormatter dateFromString:[[list objectAtIndex:currentChoice] objectAtIndex:3]];
    _Date.date=inputDate;
    _Option.text=[[list objectAtIndex:currentChoice] objectAtIndex:4];
    //NSLog(@date= %@, inputDate);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonpress:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"添加" message:@"请输入价钱和数量" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES  completion:nil];
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString*addNum=((UITextField*)[alertController.textFields objectAtIndex:0]).text;
        int origin=[_Num.text intValue];
        int add=[addNum intValue];
        origin = origin+add;
        NSString *temp=[NSString stringWithFormat:@"%d",origin];
        NSString* addPrice = ((UITextField*)[alertController.textFields objectAtIndex:1]).text;
        int p=[addPrice intValue];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];

        NSString *da=[dateFormatter stringFromDate:_Date.date];
        [orderlist addObject:[NSArray arrayWithObjects:_Name.text,addNum,addPrice,nil]];
        NSLog(@"%@",orderlist);
        [list removeObjectAtIndex:currentChoice];
        [list addObject:[NSArray arrayWithObjects:_Name.text,temp,_Price.text,da,_Option.text, nil]];
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/data/itemlist.txt"];
        [list writeToFile:path atomically:YES];
        path=[NSHomeDirectory() stringByAppendingString:@"/Documents/data/orderlist.txt"];
        [orderlist writeToFile:path  atomically:YES];
        
    }];
    
    //产生数量输入
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"数量";
    }];
    
    //产生价格输入
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"价格";
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
