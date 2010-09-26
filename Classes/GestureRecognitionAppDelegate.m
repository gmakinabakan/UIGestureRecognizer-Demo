//
//  GestureRecognitionAppDelegate.m
//  GestureRecognition
//
//  Created by Gun Makinabakan on 6/24/10.
//  Copyright iMobileCode 2010. All rights reserved.
//

#import "GestureRecognitionAppDelegate.h"
#import "GestureRecognitionViewController.h"

@implementation GestureRecognitionAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize logoView;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch. 
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	//UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
	//[logoView addGestureRecognizer:panRecognizer];
	//[panRecognizer release];
	
	UIRotationGestureRecognizer* rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationRecognized:)];
	[logoView addGestureRecognizer:rotationRecognizer];
	[rotationRecognizer release];
	
	UIPinchGestureRecognizer* pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchRecognized:)];
	[logoView addGestureRecognizer:pinchRecognizer];
	[pinchRecognizer release];
	
	UISwipeGestureRecognizer* swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
	swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
	[logoView addGestureRecognizer:swipeRecognizer];
	[swipeRecognizer release];

	
	/*
	UIRotationGestureRecognizer* rotationRecognizer2 = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationRecognized:)];
	[logoView.superview addGestureRecognizer:rotationRecognizer2];
	[rotationRecognizer2 release];
	
	UIPinchGestureRecognizer* pinchRecognizer2 = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchRecognized:)];
	[logoView.superview addGestureRecognizer:pinchRecognizer2];
	[pinchRecognizer2 release];
	*/
	
	
	return YES;
}

-(void) panRecognized:(UIPanGestureRecognizer*) recognizer
{
	UIView* view = recognizer.view;
	
	CGPoint oldCenter = view.center;
	CGPoint transition = [recognizer translationInView:view.superview];
	
	view.center = CGPointMake(oldCenter.x+transition.x, oldCenter.y+transition.y);
	
	[recognizer setTranslation:CGPointZero inView:view.superview];
}

-(void) rotationRecognized:(UIRotationGestureRecognizer*) recognizer
{
	CGAffineTransform oldTransform = recognizer.view.transform;
	
	CGFloat rotation = recognizer.rotation;
	
	CGAffineTransform transform = CGAffineTransformRotate(oldTransform, rotation);
	
	recognizer.view.transform = transform;
	
	recognizer.rotation = 0;
	
}

-(void) pinchRecognized:(UIPinchGestureRecognizer*) recognizer
{
	CGAffineTransform oldTransform = recognizer.view.transform;
	
	CGFloat scale = recognizer.scale;
	
	CGAffineTransform transform = CGAffineTransformScale(oldTransform, scale, scale);
	
	recognizer.view.transform = transform;
	
	recognizer.scale = 1;
	
}

-(void) swipeRecognized:(UISwipeGestureRecognizer*) recognizer
{
	UIView* view = recognizer.view;
	
	view.center = CGPointMake(0, 0);	
	if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
	{
		view.hidden = YES;
	}
	else if(recognizer.direction == UISwipeGestureRecognizerDirectionRight)
	{
		view.hidden = NO;
	}
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
