//
//  ViewController.h
//  iTestGestures
//
//  Created by Hussein Abdulwahid on 09/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myView.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "MyView2.h"
@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
{
	
	IBOutlet myView *theView, *theview2;
	IBOutlet MyView2 *my2;
	UILongPressGestureRecognizer *longPress;
	UITapGestureRecognizer *tapGesture;
	UIPinchGestureRecognizer *pinchGesture;
	UIRotationGestureRecognizer	*rotateGesture;
	UIPanGestureRecognizer *panGesture;
	UISwipeGestureRecognizer *swipeGesture;
	IBOutlet UILabel *label;
	int prevY,dY;
	int velocity;
}

-(void) setupGestures;
-(IBAction) slideChanged:(id) sender;
-(IBAction) changeIt:(id)sender;


@end
