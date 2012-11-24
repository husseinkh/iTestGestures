//
//  MyView2.m
//  iTestGestures
//
//  Created by Hussein Abdulwahid on 09/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "MyView2.h"

@implementation MyView2
@synthesize angle;
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
    // Drawing code
	
	CGContextRef cnt=UIGraphicsGetCurrentContext();
	CGPoint center;
	CGRect rect1;
	rect1=rect;
	rect1.origin=CGPointMake(rect.origin.x+20, rect.origin.y+20);
	rect1.size=CGSizeMake(rect.size.width-40, rect.size.height-40);
	center.x=rect1.origin.x+rect1.size.width/2;
	center.y=rect1.origin.y+rect1.size.height/2;

		//CGContextTranslateCTM(cnt, center.x, center.y);
		//CGContextRotateCTM(cnt, angle/2);

		//CGContextTranslateCTM(cnt,-center.x,-center.y);
	CGMutablePathRef path1=CGPathCreateMutable();
	CGPathMoveToPoint(path1, NULL, 100, 100);
	CGPathAddLineToPoint(path1, NULL, 150, 100);
	CGPathAddLineToPoint(path1, NULL, 150, 150);
	CGPathAddLineToPoint(path1, NULL, 100, 150);
	CGPathAddLineToPoint(path1, NULL, 100, 100);

	rect1=CGPathGetBoundingBox(path1);
	center.x=rect1.origin.x+rect1.size.width/2;
	center.y=rect1.origin.y+rect1.size.height/2;
	CGAffineTransform transform;
	transform=CGAffineTransformMakeTranslation(center.x, center.y);
		//transform=CGAffineTransformRotate(transform, angle);
	transform=CGAffineTransformScale(transform, angle, angle);
	transform=CGAffineTransformTranslate(transform, -center.x, -center.y);

	CGMutablePathRef path=CGPathCreateMutable();
		//CGPathAddRect(path, &transform, rect1);
	CGPathAddPath(path, &transform, path1);
	[[UIColor blueColor] setFill];
	CGContextAddPath(cnt, path);
		//CGContextFillRect(cnt, rect1);
	CGContextStrokePath(cnt);
		//CGContextFillPath(cnt);
	
}


@end
