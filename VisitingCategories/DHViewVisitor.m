//
//  DHViewVisitor.m
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import "DHViewVisitor.h"

@implementation DHViewVisitor
- (void)visitView:(UIView *)view
{
    // subclass does this
}
- (void)visitLabel:(UILabel *)label
{
    // subclass does this
}
- (void)visitButton:(UIButton *)button
{
    // subclass does this
}
- (void)visitToolbar:(UIToolbar *)toolbar
{
    // subclass does this
}
- (void)visitStepper:(UIStepper *)stepper
{
    // subclass does this
}
@end

#pragma mark - DHAcceptsViewVisitor implementations

@implementation UIView (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor
{
    [visitor visitView:self];
}
@end

@implementation UILabel (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor
{
    [visitor visitLabel:self];
}
@end

@implementation UIButton (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor
{
    [visitor visitButton:self];
}
@end

@implementation UIToolbar (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor
{
    [visitor visitToolbar:self];
}
@end

@implementation UIStepper (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor
{
    [visitor visitStepper:self];
}
@end





