//
//  OrderTableView.h
//  test
//
//  Created by Andy Chang on 17/1/14.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableView : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *ordertable;

@end
