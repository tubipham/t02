//
//  ScrollPageLayoutController.h
//  SmartCal
//
//  Created by Trung Nguyen on 5/21/10.
//  Copyright 2010 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LayoutController.h"

@class MovableView;

@interface ScrollPageLayoutController : LayoutController<UIScrollViewDelegate> {
	NSMutableArray *currentPage;
	NSMutableArray *previousPage;
	NSMutableArray *nextPage;
	
	NSMutableArray *reusableViews;
	
	//scroll management
	BOOL scrollingOrientationCheck;
	//CGPoint lastContentOffset;
	BOOL isVerticalScroll;
	BOOL isHorizontalScroll;
    
    NSInteger bgCount;
}

@property (nonatomic, retain) NSMutableArray *currentPage;
@property (nonatomic, retain) NSMutableArray *previousPage;
@property (nonatomic, retain) NSMutableArray *nextPage;

@property (nonatomic, retain) NSMutableArray *reusableViews;

- (void) refreshPage:(NSInteger)page needFree:(BOOL)needFree;
- (void)scrollPage:(NSInteger) page;
- (MovableView *)getReusableView;

@end
