//
//  DHViewController.m
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import "DHViewController.h"
#import "DHBlueVisitor.h"
#import "UIView+AppearanceVisitor.h"

@implementation DHViewController

+ (void)initialize {
    [[UIView appearanceWhenContainedIn:self, nil] setAppearanceVisitor:[DHBlueVisitor new]];
}

@end
