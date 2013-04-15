//
//  PlannerBottomDayCal.m
//  SmartDayPro
//
//  Created by Nguyen Van Thuc on 3/18/13.
//  Copyright (c) 2013 Left Coast Logic. All rights reserved.
//

#import "PlannerBottomDayCal.h"
#import "ContentScrollView.h"
#import "PlannerScheduleView.h"
#import "PlannerCalendarLayoutController.h"
#import "TaskView.h"
#import "Task.h"
#import "CalendarPlannerMovableController.h"
#import "TaskOutlineView.h"
#import "Common.h"
#import "TaskManager.h"
#import "TimeSlotView.h"
#import "PlannerViewController.h"
#import "PlannerView.h"
#import "PlannerMonthView.h"

extern PlannerViewController *_plannerViewCtrler;

@implementation PlannerBottomDayCal

@synthesize movableController;
@synthesize plannerScheduleView;

@synthesize calendarLayoutController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithRed:237 green:237 blue:237 alpha:1.0];
        
        // add scroll view
        scrollView = [[ContentScrollView alloc] initWithFrame:self.bounds];
        scrollView.canCancelContentTouches = NO;
        scrollView.backgroundColor = [UIColor clearColor];
        //scrollView.delegate = calendarLayoutController;
        [self addSubview:scrollView];
        [scrollView release];
        
        plannerScheduleView = [[PlannerScheduleView alloc] initWithFrame:scrollView.bounds];
        //plannerScheduleView = [[PlannerScheduleView alloc] initWithFrame:CGRectOffset(scrollView.bounds, scrollView.bounds.size.width, 0)];
        [scrollView addSubview:plannerScheduleView];
        [plannerScheduleView release];
        
        calendarLayoutController = [[PlannerCalendarLayoutController alloc] init];
        // add movable controller
        movableController = [[CalendarPlannerMovableController alloc] init];
        calendarLayoutController.movableController = movableController;
        
        calendarLayoutController.viewContainer = scrollView;
        [calendarLayoutController layout];
        
        scrollView.contentSize = CGSizeMake(plannerScheduleView.frame.size.width, plannerScheduleView.frame.size.height);
        //scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        scrollView.scrollEnabled = YES;
        scrollView.scrollsToTop = NO;
        scrollView.showsHorizontalScrollIndicator = YES;
        scrollView.showsVerticalScrollIndicator = YES;
        scrollView.directionalLockEnabled = YES;
        
        // outline for resizing event
        outlineView = [[TaskOutlineView alloc] initWithFrame:CGRectZero];
        [self addSubview:outlineView];
        [outlineView release];
        
        // init quick-add-event view
        CGFloat dayWidth = (self.bounds.size.width - TIMELINE_TITLE_WIDTH)/7;
        quickAddTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, dayWidth, 2*TIME_SLOT_HEIGHT)];
        quickAddTextField.delegate = self;
        quickAddTextField.borderStyle = UITextBorderStyleRoundedRect;
        quickAddTextField.keyboardType=UIKeyboardTypeDefault;
        quickAddTextField.returnKeyType = UIReturnKeyDone;
        quickAddTextField.font=[UIFont systemFontOfSize:16];
        quickAddTextField.hidden = YES;
        
        [self addSubview:quickAddTextField];
        [quickAddTextField release];
    }
    return self;
}

- (void)changeWeek: (NSDate*) startDate {
    [UIView beginAnimations:@"resize_animation" context:NULL];
    [UIView setAnimationDuration:0.3];

    [self updateFrame];
    
    // reload week view
    calendarLayoutController.startDate = startDate;
    [calendarLayoutController layout];
    
    [UIView commitAnimations];
}

- (void)updateFrame {
    scrollView.frame = self.bounds;
    scrollView.contentSize = CGSizeMake(plannerScheduleView.frame.size.width, plannerScheduleView.frame.size.height);
}

- (void) refreshLayout
{
    [calendarLayoutController layout];
}

- (void) refreshTaskView4Key:(NSInteger)taskKey
{
	for (UIView *view in scrollView.subviews)
	{
		if ([view isKindOfClass:[TaskView class]])
		{
            TaskView *taskView = (TaskView *) view;
            
            Task *task = taskView.task;
            
            if (task.original != nil)
            {
                task = task.original;
            }
            
            if (task.primaryKey == taskKey)
            {
                [taskView setNeedsDisplay];
                
                break;
            }
		}
	}
}

- (void)dealloc {
    [movableController release];
    [super dealloc];
}

- (void) setMovableContentView:(UIView *)contentView
{
    if ([movableController isKindOfClass:[DummyMovableController class]])
    {
        ((DummyMovableController *) movableController).contentView = contentView;
    }
}

#pragma mark resizing handle

- (void)beginResize:(TaskView *)view
{
	//[self deselect];
	
	//outlineView.tag = view.tag;
    outlineView.tag = view.task;
	
	CGRect frm = view.frame;
	
	frm.origin = [view.superview convertPoint:frm.origin toView:self];
	
	[outlineView changeFrame:frm];
	
	outlineView.hidden = NO;
	
	scrollView.scrollEnabled = NO;
	scrollView.userInteractionEnabled = NO;
}

- (void)finishResize
{
	Task *task = (Task *)outlineView.tag;
	
	int segments = [outlineView getResizedSegments];
	
	if (segments != 0 && outlineView.handleFlag != 0)
	{
		//if ([task isEvent])
		{
			if (outlineView.handleFlag == 1)
			{
				task.startTime = [Common dateByAddNumSecond:-segments*15*60 toDate:task.startTime];
			}
			else if (outlineView.handleFlag == 2)
			{
				task.endTime = [Common dateByAddNumSecond:segments*15*60 toDate:task.endTime];
			}
		}
		/*else if ([task isTask])
		{
			if (task.original != nil)
			{
				task = task.original;
			}
			
			task.duration += segments*15*60;
		}*/
        
		[[TaskManager getInstance] resizeTask:task];
        
        [calendarLayoutController layout];
	}
    
	[self stopResize];
}

- (void) stopResize
{
	outlineView.hidden = YES;
	
	scrollView.scrollEnabled = YES;
	scrollView.userInteractionEnabled = YES;
}


#pragma mark quick add event

-(void)showQuickAdd:(TimeSlotView *)timeSlot sender: (UILongPressGestureRecognizer *)sender
{
    // collapse current week
    if (_plannerViewCtrler != nil) {
        [_plannerViewCtrler.plannerView.monthView collapseCurrentWeek];
    }
    
    scrollView.scrollEnabled = NO;
	scrollView.userInteractionEnabled = NO;
    
    // 1, calculate X
    CGPoint coords = [sender locationInView:sender.view];
    //CGFloat dayWidth = (self.bounds.size.width - TIMELINE_TITLE_WIDTH)/7;
    CGFloat dayWidth = quickAddTextField.frame.size.width;
    NSInteger dayNumber = (coords.x-TIMELINE_TITLE_WIDTH)/dayWidth;
    
    CGFloat x = dayNumber * dayWidth + TIMELINE_TITLE_WIDTH;
    
    CGRect frm = quickAddTextField.frame;
    
    frm.origin.x = x;
    
    // 2, calculate Y
    CGFloat ymargin = TIME_SLOT_HEIGHT/2;
	
	NSCalendar *gregorian = [NSCalendar autoupdatingCurrentCalendar];
	
	NSDateComponents *comps = [gregorian components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:timeSlot.time];
	NSInteger hour = [comps hour];
	NSInteger minute = [comps minute];
	
	NSInteger slotIdx = 2*hour + minute/30;
	
	CGPoint offset = scrollView.contentOffset;
	
	frm.origin.y = ymargin + slotIdx * TIME_SLOT_HEIGHT + 1;
	
	if (minute >= 30)
	{
		minute -= 30;
	}
	
	frm.origin.y += minute*TIME_SLOT_HEIGHT/30;
	
	CGPoint p = [scrollView convertPoint:frm.origin toView:self];
	p.x = frm.origin.x;
    
    CGFloat kbH = 352;//[Common getKeyboardHeight];
	
    //if (p.y + frm.size.height > contentView.bounds.size.height - kbH)
    {
        CGFloat dy = (p.y + frm.size.height - self.bounds.size.height + kbH) + 20;
        
		p.y -= dy;
		offset.y += dy;
		
		[scrollView setContentOffset:offset animated:NO];
    }
	
	frm.origin = p;
    if (offset.y < 0) {
        frm.origin.y += offset.y;
        offset.y = 0;
    }
    
    // 3, show quick-add
    quickAddTextField.frame = frm;
	quickAddTextField.text = @"";
	quickAddTextField.hidden = NO;
    
    // calculate time
    NSDate *startDate = [[self.calendarLayoutController.startDate copy] autorelease];
    startDate = [Common copyTimeFromDate:timeSlot.time toDate:startDate];
    NSDate *toDate = [Common dateByAddNumDay:dayNumber toDate:startDate];
	quickAddTextField.tag = [toDate timeIntervalSince1970];
	
	[quickAddTextField becomeFirstResponder];
    scrollView.contentOffset = offset;
}

-(void)quickAdd:(NSString *)name startTime:(NSDate *)startTime
{
	//////printf("quick add - %s, start: %s\n", [name UTF8String], [[startTime description] UTF8String]);
	
	Task *event = [[Task alloc] init];
	
	event.name = name;
	event.startTime = startTime;
	event.endTime = [Common dateByAddNumSecond:3600 toDate:event.startTime];
	
	event.type = TYPE_EVENT;
	
	[[TaskManager getInstance] addTask:event];
	
	[event release];
	
	//[self refreshLayout];
}

#pragma mark TextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	textField.hidden = YES;
	scrollView.scrollEnabled = YES;
	scrollView.userInteractionEnabled = YES;
	//addButton.enabled = YES;
	
	if (![textField.text isEqualToString:@""])
	{
		NSDate *startTime = [NSDate dateWithTimeIntervalSince1970:textField.tag];
		
		//TaskManager *tm = [TaskManager getInstance];
		
		[self quickAdd:textField.text startTime:startTime];
	}
	
    // expand current week
    if (_plannerViewCtrler != nil) {
        [_plannerViewCtrler.plannerView.monthView expandCurrentWeek];
    }
	return YES;
}
@end