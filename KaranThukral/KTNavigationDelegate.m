//
//  KTNavigationDelegate.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "KTNavigationDelegate.h"
#import "KaranThukralViewController.h"
#import "AboutMeViewController.h"

@implementation KTNavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    id<UIViewControllerAnimatedTransitioning> trans;
    
    if ([fromVC isMemberOfClass:[KaranThukralViewController class]] || [toVC isMemberOfClass:[AboutMeViewController class]]) {
        trans = (id<UIViewControllerAnimatedTransitioning>)[AnimatedCutomTransition new];
        if ([fromVC isMemberOfClass:[KaranThukralViewController class]]) {
            ((AnimatedCutomTransition*)trans).inReverse = NO;
        } else {
            ((AnimatedCutomTransition *)trans).inReverse = YES;
        }
    }

    return trans;
}


@end
