//
//  DHBlueVisitor.m
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import "DHBlueVisitor.h"
#import <QuartzCore/QuartzCore.h>

@implementation DHBlueVisitor
- (void)visitView:(UIView *)view
{
    view.backgroundColor = [UIColor colorWithRed:0.826 green:0.863 blue:1.000 alpha:1.000];
}
- (void)visitLabel:(UILabel *)label
{
    label.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:22.f];
    label.textColor = [UIColor colorWithRed:0.173 green:0.277 blue:0.998 alpha:1.000];
}
- (void)visitButton:(UIButton *)button
{
    button.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:22.f];
    [button setBackgroundColor:[UIColor colorWithRed:0.192 green:0.296 blue:0.998 alpha:1.000]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 22.f;
}
- (void)visitToolbar:(UIToolbar *)toolbar
{
    [toolbar setTintColor:[UIColor colorWithRed:0.287 green:0.390 blue:0.998 alpha:1.000]];
}
- (void)visitStepper:(UIStepper *)stepper
{
    [stepper setTintColor:[UIColor colorWithRed:0.287 green:0.390 blue:0.998 alpha:1.000]];
}

@end
