//
//  ViewController.h
//  SlideTableView
//
//  Created by 舒 方昊 on 13-6-28.
//  Copyright (c) 2013年 舒 方昊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderCell.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SliderDelegate>
{
    NSMutableArray* data;
}
@property (retain, nonatomic) IBOutlet UITableView *m_tableView;
@property (retain, nonatomic) IBOutlet SliderCell *local_cell;

@end
