//
//  UIView+AppearanceVisitor.m
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import "UIView+AppearanceVisitor.h"
#import "DHViewVisitor.h"

@class DHViewVisitor;
@implementation UIView (AppearanceVisitor)
- (void)setAppearanceVisitor:(DHViewVisitor *)visitor
{
    [self acceptVisitor:visitor];
}
@end
