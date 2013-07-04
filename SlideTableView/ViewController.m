//
//  ViewController.m
//  SlideTableView
//
//  Created by 舒 方昊 on 13-6-28.
//  Copyright (c) 2013年 舒 方昊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data= [[NSMutableArray alloc]init];
    for (int i=0; i<20; i++) {
        [data addObject:[NSNumber numberWithFloat:0]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_m_tableView release];
    [_local_cell release];
    [super dealloc];
}

#pragma mark =======================
#pragma mark TableView Delegate methods
#pragma mark =======================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"data count is %d",data.count);
    return data.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SliderCell* cell= (SliderCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier=@"cellIdentifier";
    SliderCell* cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    int row= indexPath.row;
    NSNumber* value= [data objectAtIndex:row];
    if (cell==NULL) {
        [[NSBundle mainBundle] loadNibNamed:@"SliderCell" owner:self options:nil];
        [self.local_cell initViewColor];
        [self.local_cell setDelegate:self];
        [self.local_cell setTag:row];
        cell=self.local_cell;
        self.local_cell= nil;
    }
    NSLog(@"show value = %f",value.floatValue);
    [cell setValue:value.floatValue];
    return cell;
}

- (void)setValue:(float)distance_value atIndex:(int)index
{
    NSLog(@"saved value is =%f at index %d",distance_value,index);
    [data replaceObjectAtIndex:index withObject:[NSNumber numberWithFloat:distance_value]];
}
@end
