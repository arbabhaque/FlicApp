//
//  ViewController.m
//  GNG2101
//
//  Created by Arbab Haque on 2018-11-15.
//  Copyright © 2018 GNG2101. All rights reserved.
//

#import "ViewController.h"

#define FLIC_APP_ID @"2bc47851-cfa4-4ff5-8c53-b920f338f46a"
#define FLIC_APP_SECRET @"f90ec1e8-b1d5-40a6-acfe-970defce85ee"

@interface ViewController () <SCLFlicManagerDelegate, SCLFlicButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SCLFlicManager configureWithDelegate:self defaultButtonDelegate:self appID:FLIC_APP_ID appSecret:FLIC_APP_SECRET backgroundExecution:NO];
}

- (IBAction)grab:(id)sender; {
    [[SCLFlicManager sharedManager] grabFlicFromFlicAppWithCallbackUrlScheme:@"FlicAppURL"];
}

- (void)flicManager:(SCLFlicManager *)manager didGrabFlicButton:(SCLFlicButton *)button withError:(NSError *)error; {
    if (error) {
        NSLog(@"Could not grab: %@", error);
    }
    
    // un-comment the following line if you need lower click latency for your application
    // this will consume more battery so don't over use it
    // button.lowLatency = YES;
}

- (void) flicButton:(SCLFlicButton *) button didReceiveButtonDown:(BOOL) queued age: (NSInteger) age; {
    NSLog(@"Yey, it works");
}

@end
