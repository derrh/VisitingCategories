//
//  DHViewVisitor.h
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHViewVisitor : NSObject
- (void)visitView:(UIView *)view;
- (void)visitLabel:(UILabel *)label;
- (void)visitButton:(UIButton *)button;
- (void)visitToolbar:(UIToolbar *)toolbar;
- (void)visitStepper:(UIStepper *)stepper;

// declare more if you need...
@end


@interface UIView (DHAcceptsViewVisitor)
- (void)acceptVisitor:(DHViewVisitor *)visitor;
@end