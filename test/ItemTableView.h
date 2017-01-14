//
//  ItemTableView.h
//  test
//
//  Created by Andy Chang on 17/1/13.
//  Copyright © 2017年 Andy Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
@interface ItemTableView : UIViewController <UITableViewDataSource,UITableViewDelegate> {
}
@property (strong, nonatomic) IBOutlet UIButton *buttonPress;
@property (strong, nonatomic) IBOutlet UITableView *itemTable;
@end
