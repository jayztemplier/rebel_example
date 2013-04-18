//
//  JTPopoverBackgroundView.m
//  RebelExample
//
//  Created by Jeremy Templier on 4/17/13.
//  Copyright (c) 2013 Jeremy Templier. All rights reserved.
//

#import "JTPopoverBackgroundView.h"

@implementation JTPopoverBackgroundView

- (instancetype)initWithFrame:(CGRect)frame popoverEdge:(CGRectEdge)popoverEdge originScreenRect:(CGRect)originScreenRect;
{
    self = [super initWithFrame:frame popoverEdge:popoverEdge originScreenRect:originScreenRect];
    if (self) {
        self.fillColor = [NSColor colorWithCalibratedRed:1.000 green:0.663 blue:0.106 alpha:1.000];
    }
    return self;
}

@end

