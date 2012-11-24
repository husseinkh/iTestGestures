//
//  ViewController.m
//  iTestGestures
//
//  Created by Hussein Abdulwahid on 09/06/2012.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
		//[self setupGestures];
	// Do any additional setup after loading the view, typically from a nib.
}


	// start setup gesture
-(void) setupGestures
{
	velocity=3500;
	panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)] ;
	[panGesture setMaximumNumberOfTouches:3];
	
	[self.view addGestureRecognizer:panGesture];
	theView.strokeWidth=1;
	theview2.strokeWidth=1;
	pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zooming:)];
	[self.view addGestureRecognizer:pinchGesture];
	
	rotateGesture=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotating:)];
	[self.view addGestureRecognizer:rotateGesture];
		//pinchGesture.delegate=self;
		//rotateGesture.delegate=self;
	swipeGesture=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiping:)];
	[swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
	[swipeGesture setNumberOfTouchesRequired:1];
	[self.view addGestureRecognizer:swipeGesture];
		//[pinchGesture requireGestureRecognizerToFail:swipeGesture];
		//[panGesture requireGestureRecognizerToFail:swipeGesture];
	tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapping:)];
	[self.view addGestureRecognizer:tapGesture];
		//[panGesture requireGestureRecognizerToFail:rotateGesture];
	longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressing:)];
	[longPress setMinimumPressDuration:0.5];
	[self.view addGestureRecognizer:longPress];
	
}

-(void) longPressing:(UILongPressGestureRecognizer *) sender
{
	NSLog(@"pressing");
}

-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	if (gestureRecognizer==rotateGesture)
		return YES;
	
	return  NO;
}


-(void) swiping:(UISwipeGestureRecognizer *) sender
{
	NSLog(@"swiping");
	label.text=@"swiping right";
	
	
}

-(void) tapping:(UITapGestureRecognizer *)sender
{
	label.text=@"tapping";
}
-(void) panAction:(UIPanGestureRecognizer *) sender
{
		if(abs([sender velocityInView:self.view].x) >=velocity)
	   {
	NSLog(@"flicking object %f",[sender velocityInView:self.view].x );
	   [UIView beginAnimations:@"delete" context:nil];
	   [theView setCenter:CGPointMake(1000, 1000)];
	   [UIView commitAnimations];
	   
	   }
	else {
		
		CGPoint point=[sender translationInView:self.view];
		CGPoint centre=[theView center];
		
			centre.x+=point.x;
			// if it is in edit mode, then can change the length
		
			// theView.strokeWidth=theView.strokeWidth+point.y;
		 centre.y+=point.y	;
		 [theView setCenter:centre];
			//[theView setNeedsDisplay];
		 [sender setTranslation:CGPointZero inView:self.view];
		 
			//prevY=centre.y;
			// label.text=[NSString stringWithFormat:@"veclocity %f",[sender velocityInView:self.view].x];
		NSLog(@"number of touches %d",[sender numberOfTouches]);

		
	}

}

-(void) slideChanged:(id)sender	
{
	
	my2.angle=((UISlider *)sender).value;
	[my2 setNeedsDisplay];
	
}

-(IBAction)changeIt:(id)sender
{
	[UIView beginAnimations:@"ToggleViews" context:nil];
	
    [UIView setAnimationDuration:1.0];
	
	
	
	CGPoint point=CGPointMake(theView.center.x	+ theView.bounds.size.width+ self.view.bounds.size.width/2, theView.center.y);
	theView.center=point;	
	theView.alpha = 0.0;
	theView.transform=CGAffineTransformMakeScale(0.5, 0.5);
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	
		// Commit the changes and perform the animation.
	
    [UIView commitAnimations];
}
-(void) zooming:(UIPinchGestureRecognizer *)sender
{
		//theView.transform=CGAffineTransformMakeScale(factor, factor);
	int noTouches=[sender numberOfTouches];
	NSLog(@"number of touches %d",[sender numberOfTouches]);
		//[sender setState:UIGestureRecognizerStateFailed];
	if (noTouches>=2) {
		
	
		CGPoint point0=	[sender locationOfTouch:0 inView:self.view];
		NSLog(@"Point x,y %f %f", point0.x,point0.y);
		theView.center=point0;

		CGPoint point1=	[sender locationOfTouch:1 inView:self.view];
	NSLog(@"Point x,y %f %f", point1.x,point1.y);
		theview2.center=point1;
		//[sender setState:UIGestureRecognizerStateFailed];
	}
}


-(void) rotating:(UIRotationGestureRecognizer *) sender;
{
	float angle=[sender rotation];
	theView.transform=CGAffineTransformMakeRotation(angle);
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
