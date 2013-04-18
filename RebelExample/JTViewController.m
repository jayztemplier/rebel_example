//
//  JTViewController.m
//  RebelExample
//
//  Created by Jeremy Templier on 4/17/13.
//  Copyright (c) 2013 Jeremy Templier. All rights reserved.
//

#import "JTViewController.h"
#import "JTPopoverBackgroundView.h"

@interface JTViewController ()
@property (nonatomic, strong) RBLPopover *popover;
//@property (nonatomic, strong) JTViewController *popoverContentViewController;
@end

@implementation JTViewController

+(id)viewController
{
	RBLViewController *controller = [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    RBLView *customView = [[RBLView alloc] init];
    customView.flipped = YES;
    customView.backgroundColor = [NSColor colorWithCalibratedRed:0.459 green:0.784 blue:0.173 alpha:1.000];
    [controller setView:customView];
    return controller;
}

- (void)viewWillAppear
{
    [super viewWillAppear];
    [self configureView];
}

- (void)viewWillDisappear
{
    if (_popover && [_popover isShown]) {
        [_popover performClose:nil];
    }
    [super viewWillDisappear];
}

#pragma mark Configure view
- (void)configureView
{
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [button setTitle:@"Back"];
    [button setTarget:self];
    [button setAction:@selector(backPressed)];
    [self.view addSubview:button];
    
    NSButton *animateButton = [[NSButton alloc] initWithFrame:CGRectMake(0, 60, 150, 44)];
    [animateButton setTitle:@"Launch Animation"];
    [animateButton setTarget:self];
    [animateButton setAction:@selector(startAnimation)];
    [self.view addSubview:animateButton];

    NSButton *popoverButton = [[NSButton alloc] initWithFrame:CGRectMake(0, 110, 150, 44)];
    [popoverButton setTitle:@"Popover"];
    [popoverButton setTarget:self];
    [popoverButton setAction:@selector(popoverButtonPressed:)];
    [self.view addSubview:popoverButton];
}
#pragma mark Actions
- (void)backPressed
{
    [self.view removeFromSuperview];
}

#pragma mark Animations
- (void)startAnimation
{
    RBLView *animedView = [[RBLView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    animedView.backgroundColor = [NSColor redColor];
    [self.view addSubview:animedView];
    
    [RBLView rbl_animateWithDuration:1.0f animations:^{
        [animedView.rbl_animator setFrame:CGRectMake(self.view.frame.size.width - 30, self.view.frame.size.height - 30, 30, 30)];
    } completion:^{
        [animedView removeFromSuperview];
    } ];
}

#pragma mark Popover
- (void)popoverButtonPressed:(NSButton *)sender
{
    if (!_popover) {
        NSViewController *viewController = [self viewControllerForPopover];
//        _popoverContentViewController
        _popover = [[RBLPopover alloc] initWithContentViewController:viewController];
        [_popover setWillCloseBlock:^(RBLPopover *popover) {
            NSLog(@"Will close the popover");
        }];
        [_popover setWillShowBlock:^(RBLPopover *popover) {
            NSLog(@"Will show the popover");
        }];
        _popover.fadeDuration = 0.5f;
        
        // Custom Background
        [_popover setBackgroundViewClass:[JTPopoverBackgroundView class]];
    }
    if ([_popover isShown]) {
        [_popover performClose:nil];
    } else {
        [_popover showRelativeToRect:sender.bounds ofView:sender preferredEdge:CGRectMinYEdge];
    }
}

- (RBLViewController *)viewControllerForPopover
{
    RBLView *customView = [[RBLView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    customView.backgroundColor = [NSColor colorWithCalibratedRed:0.839 green:0.122 blue:0.173 alpha:1.000];
    RBLViewController *viewController = [RBLViewController viewController];
    [viewController setView:customView];
    return viewController;
}

#pragma mark Popover Delegate

@end
