//
//  SliderCell.m
//

#import "SliderCell.h"

@implementation SliderCell
@synthesize cover_view,delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initViewColor
{
    [cover_view setBackgroundColor:[UIColor orangeColor]];
    origin_frame=cover_view.frame;
}
- (void)setValue:(float)value
{
    [self changeColor:value];
    int _value= value*100/235;
    [_value_label setText:[NSString stringWithFormat:@"%d%%",_value]];
}
-(void)changeColor:(float)factor
{
//     if (factor<-1) {
//        return;
//    }
    NSLog(@"color factor is =%f",factor);
    [_color_view setBackgroundColor:[UIColor colorWithRed:0.00012*(factor)*(factor)+0.0002 green:0.00003*(factor)*(factor)+0.0013 blue:0.001*(factor)*(factor) alpha:1]];
}

-(void)playSlideAnimation:(UIView*)_view withDistance:(CGFloat)distance
{
    float v=2*1000;
    float t=distance/v;
    float delta=3;
    CGRect _frame=_view.frame;
    [UIView animateWithDuration:t
                     animations:^(void){
                         [_view setFrame:CGRectMake(_frame.origin.x-distance+delta, _frame.origin.y, _frame.size.width+delta, _frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         [UIView beginAnimations:@"animation" context:nil];
                         [UIView setAnimationDuration:0.05f];
                         [_view setFrame:origin_frame];
                         [UIView commitAnimations];
                     }
     ];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location=[[touches anyObject]locationInView:self];
    start_x= location.x;
    frame= cover_view.frame;
    NSLog(@"start x= %f",start_x);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location=[[touches anyObject]locationInView:self];
    CGFloat distance= MIN(0, start_x-location.x);
    NSLog(@"distance= %f",distance);
    [cover_view setFrame:CGRectMake(frame.origin.x-distance, frame.origin.y, frame.size.width, frame.size.height)];
    
    [self changeColor:distance];
    int _value= -distance*100/235;
    [_value_label setText:[NSString stringWithFormat:@"%d%%",_value]];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location=[[touches anyObject]locationInView:self];
    finished_x=location.x;
    NSLog(@"finished==%f",start_x);
    
    [self playSlideAnimation:cover_view withDistance:(MAX(0, finished_x-start_x))];
    [delegate setValue:MAX(0, finished_x-start_x) atIndex:[self tag]];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location=[[touches anyObject]locationInView:self];
    finished_x=location.x;
    NSLog(@"finished==%f",start_x);
    [self playSlideAnimation:cover_view withDistance:(MAX(0, finished_x-start_x))];
    [delegate setValue:MAX(0, finished_x-start_x) atIndex:[self tag]];
}

- (void)dealloc {
    [cover_view release];
    [_value_label release];
    [_color_view release];
    [super dealloc];
}
@end
