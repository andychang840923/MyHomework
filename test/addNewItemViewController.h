//
//  addNewItemViewController.h
//  test
//
//  Created by Andy Chang on 17/1/14.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addNewItemViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *addName;
@property (strong, nonatomic) IBOutlet UITextField *addNum;

@property (strong, nonatomic) IBOutlet UITextField *addPrice;
@property (strong, nonatomic) IBOutlet UIDatePicker *addDate;
@property (strong, nonatomic) IBOutlet UITextField *addOption;
@end
