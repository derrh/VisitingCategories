//
//  UIView+AppearanceVisitor.h
//  VisitingCategories
//
//  Created by derrick on 5/6/13.
//  Copyright (c) 2013 Derrick Hathaway. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHViewVisitor;
@interface UIView (AppearanceVisitor)
- (void)setAppearanceVisitor:(DHViewVisitor *)visitor;
@end
