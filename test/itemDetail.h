//
//  itemDetail.h
//  test
//
//  Created by Andy Chang on 17/1/13.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Constant.h"
@interface itemDetail : UIViewController<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIDatePicker *Date;
@property (strong, nonatomic) IBOutlet UITextField *Name;
@property (strong, nonatomic) IBOutlet UITextField *Num;
@property (strong, nonatomic) IBOutlet UITextField *Price;
@property (strong, nonatomic) IBOutlet UITextField *Option;
//#import "Constant.h"
@end
