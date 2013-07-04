//
//  SliderCell.h
//

#import <UIKit/UIKit.h>
@protocol SliderDelegate <NSObject>

-(void)setValue:(float)distance_value atIndex:(int)index;

@end
@interface SliderCell : UITableViewCell
{
    float start_x;
    float finished_x;
    CGRect frame;
    CGRect origin_frame;
}
@property (retain, nonatomic) IBOutlet UIView *color_view;
@property (assign, nonatomic) id<SliderDelegate> delegate;
@property (retain, nonatomic) IBOutlet UIView *cover_view;
@property (retain, nonatomic) IBOutlet UILabel *value_label;
-(void)initViewColor;
-(void)setValue:(float)value;
@end
