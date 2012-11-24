//
//  myView.m
//  iTestGestures
//
//  Created by Hussein Abdulwahid on 09/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "myView.h"

@implementation myView

@synthesize strokeWidth;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{

	CGRect clientRect;
	clientRect.origin=CGPointMake(rect.origin.x+10, rect.origin.y+10);
	clientRect.size=CGSizeMake(rect.size.width-20, rect.size.height-20);
	[[UIColor clearColor] setFill];
	CGContextRef cnt=UIGraphicsGetCurrentContext();
	CGContextFillRect(cnt, rect);

	[[UIColor blueColor] setFill];
	CGContextFillRect(cnt, clientRect);
	[[UIColor redColor] setStroke];
	CGContextStrokeRectWithWidth(cnt, clientRect, strokeWidth);
	CGRect rect1;
	rect1=rect;
		//rect1.origin=CGPointMake(rect1.origin.x-10, rect1.origin.y-10);
	rect1.size=CGSizeMake(10, 10);
	[[UIColor greenColor] setFill];
		CGContextFillRect(cnt, rect1);
	float xright,ydown;
	xright=rect.origin.x+rect.size.width-10;
	ydown=rect.origin.y+rect.size.height-10;
	rect1.origin=CGPointMake(xright, rect.origin.y);
	CGContextFillRect(cnt, rect1);
	rect1.origin=CGPointMake(xright, ydown);
	CGContextFillRect(cnt, rect1);
	rect1.origin=CGPointMake(rect.origin.x, ydown);
	CGContextFillRect(cnt, rect1);


}


@end
