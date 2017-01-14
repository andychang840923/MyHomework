//
//  addNewItemViewController.m
//  test
//
//  Created by Andy Chang on 17/1/14.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import "addNewItemViewController.h"

@interface addNewItemViewController ()

@end
extern NSMutableArray*list;
extern NSMutableArray*orderlist;
@implementation addNewItemViewController

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveNewItem:(id)sender {
    NSString *name=_addName.text;
    NSString *num=_addNum.text;
    NSString *price = _addPrice.text;
    NSString *option=_addOption.text;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date =  [dateFormatter stringFromDate:_addDate.date];
    [list addObject:[NSArray arrayWithObjects:name,num,price,date,option,nil]];
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/data/itemlist.txt"];
    [list writeToFile:path atomically:YES];
    /*
    for (NSString *string in list) {
        NSLog(@"array6 content is %@",string);
         [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [@"\n" writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
     */
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
