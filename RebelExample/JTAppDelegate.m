//
//  JTAppDelegate.m
//  RebelExample
//
//  Created by Jeremy Templier on 4/16/13.
//  Copyright (c) 2013 Jeremy Templier. All rights reserved.
//

#import "JTAppDelegate.h"
#import <Rebel/Rebel.h>
#import "JTViewController.h"

@interface JTAppDelegate ()

@property (strong, nonatomic) RBLViewController *viewController;
@property (strong, nonatomic) JTViewController *customController;
@end

@implementation JTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    RBLView *customView = [[RBLView alloc] init];
    customView.backgroundColor = [NSColor colorWithCalibratedRed:0.000 green:0.330 blue:0.800 alpha:1.000];
    _viewController = [RBLViewController viewController];
    [_viewController setView:customView];
    [_window setContentView:_viewController.view];
    
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [button setTitle:@"Display custom view controller"];
    [button setTarget:self];
    [button setAction:@selector(displayCustomController)];
    [customView addSubview:button];
    
    // Turn this boolean to NO to see where the button will be positionned
    customView.flipped = YES;
}

- (void)displayCustomController
{
    _customController = [JTViewController viewController];
    _customController.view.frame = _viewController.view.bounds;
    [_viewController.view addSubview:_customController.view];
}
@end
