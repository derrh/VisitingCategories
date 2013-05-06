You're all familiar with the [visitor pattern (wikipedia)](http://en.wikipedia.org/wiki/Visitor_pattern). One of its limitations is that it's only really useful for classes you are writing yourself. That is, unless you have a runtime that allows you to add methods to existing classes like the Objective-C runtime allows via [categories (Apple)](http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html).


**Preparing to Visit**

Say for example you want to add the ability to traverse your UIView hierarchy and visit each view. The first step is to provide the visitor type that you would like to have visit your views.

    @interface ViewVisitor : NSObject
    - (void)visitView:(UIView *)view;
    - (void)visitLabel:(UILabel *)label;
    - (void)visitButton:(UIButton *)button;
    ...
    @end

Now add an `acceptVisitor:` method to UIView.

    @interface UIView (AcceptsViewVisitor)
    - (void)acceptVisitor:(ViewVisitor *)visitor;
    @end

Now for `UIView` and each of it's subclasses, implement the `acceptVisitor:`.

    @implementation UIView (AcceptsViewVisitor)
    - (void)acceptVisitor:(ViewVisitor *)visitor {
      [visitor visitView:self];
    }
    @end

You should provide an implementation of this category for each `visit___:` method you provide in your `ViewVisitor` class. If you don't provide an implementation for a particular `UIView` subclass then it's nearest parent class's implementation of the `AcceptsViewVisitor` will invoke that parent class's associated `visit___:` method. For example if you provide a `visitScrollView:` method and implement the `AcceptsViewVisitor` category for `UIScrollView`, then calling `acceptVisitor:` on a `UITableView` will result in `visitScrollView:` being called on your visitor with that `UITableView` instance.


**Paying a Visit**

Now you can pass your useful subclass of `ViewVisitor` and pass an instance to each of the views you would like to visit.

    MyNSLoggingVisitor *visitor = [MyNSLoggingVisitor new];
    for (UIView *subview in view.subviews)
      [subview acceptVisitor:visitor];
    }];


**Making an Appearance**

One fun application of this approach is to style your UI using UIKit's [Appearance Proxies (NSHipster)](http://nshipster.com/uiappearance/).

It turns out that you can set custom setters on class' UIAppearanceProxies and these setters (which must have an object as the first parameter and start with 'set') will be invoked at the appropriate time for instances of that class. Leveraging that we can style a whole UIViewController's contents with a single ViewVisitor instance by providing a setter in a UIView category with the following implementation:

    - (void)setAppearanceVisitor:(ViewVisitor *)visitor {
      [self acceptVisitor:visitor];
    }

Now for your `WickedAwesomeViewController` just add this code to your `+ (void)initialize` method or invoke it somewhere before your view controller appears:

    MakeItPrettyViewVisitor *visitor = [MakeItPrettyViewVisitor new];
    [[UIView appearanceWhenContainedIn:
      [WickedAwesomeViewController class], nil]
        setAppearanceVisitor:visitor];

