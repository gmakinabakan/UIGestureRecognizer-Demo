//
//  GestureRecognitionAppDelegate.h
//  GestureRecognition
//
//  Created by Gun Makinabakan on 6/24/10.
//  Copyright iMobileCode 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GestureRecognitionViewController;

@interface GestureRecognitionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GestureRecognitionViewController *viewController;
	UIImageView* logoView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GestureRecognitionViewController *viewController;
@property (nonatomic, retain) IBOutlet UIImageView* logoView;

@end

