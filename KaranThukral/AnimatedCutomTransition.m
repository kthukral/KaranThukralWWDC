//
//  AnimatedCutomTransition.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "AnimatedCutomTransition.h"
#import "KaranThukralViewController.h"
#import "AboutMeViewController.h"

@implementation AnimatedCutomTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    UIView *menuItemPatch;
    
    UIView *background = [UIView new];
    background.frame = container.frame;
    background.backgroundColor = [UIColor whiteColor];
    background.alpha = 0.0f;
    [container addSubview:background];
    [UIView animateWithDuration:0.2f animations:^(void){
        background.alpha = 1.0f;
    }];
    
    toViewController.navigationItem.title = @"";
    
    UILabel* newTitle;
    
    if (self.inReverse) {
        
        newTitle = (UILabel*)fromViewController.navigationItem.titleView;
        [newTitle removeFromSuperview];
        
        CGPoint convertedPosition = [fromViewController.navigationController.navigationBar convertPoint:newTitle.frame.origin toView:fromViewController.navigationController.view];
        newTitle.frame = CGRectMake(convertedPosition.x, convertedPosition.y, newTitle.frame.size.width, newTitle.frame.size.height);
        newTitle.alpha = 1.0f;
        
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        
        menuItemPatch = [UIView new];
        CGRect labelFrame = [(KaranThukralViewController*)toViewController selectedLabelMenuFrame];
        menuItemPatch.frame = CGRectMake(0.0f, labelFrame.origin.y+1, container.frame.size.width, labelFrame.size.height-1);
        menuItemPatch.backgroundColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.0f];
        menuItemPatch.userInteractionEnabled = NO;
        menuItemPatch.alpha = 0.0f;
        [fromViewController.navigationController.view addSubview:menuItemPatch];
        
    }
    else {
        newTitle = [UILabel new];
        newTitle.userInteractionEnabled = NO;
        
        [container addSubview:toViewController.view];
        UILabel* oldTitle = [(KaranThukralViewController*)fromViewController selectedLabelForTransitioning];
        
        newTitle.text = oldTitle.text;
        newTitle.lineBreakMode = NSLineBreakByClipping;
        newTitle.frame = [(KaranThukralViewController*)fromViewController selectedLabelNavigationFrame];
        
        CGRect expectedFrame = [newTitle.text boundingRectWithSize:CGSizeMake(newTitle.frame.size.width, 9999)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName:newTitle.font}
                                                           context:nil];
        expectedFrame.size.height = ceil(expectedFrame.size.height);
        newTitle.frame = CGRectMake(newTitle.frame.origin.x, newTitle.frame.origin.y+11, expectedFrame.size.width, expectedFrame.size.height);
        toViewController.view.alpha = 0.0f;
    }
    
    fromViewController.navigationItem.title = @"";
    fromViewController.navigationItem.titleView = nil;
    [fromViewController.navigationController.view addSubview:newTitle];
    
    
    
    [UIView animateWithDuration:0.4f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        
        if (self.inReverse) {
            
            menuItemPatch.alpha = 1.0f;
            toViewController.view.alpha = 1.0f;
            
            CGRect menuItemFrame = [(KaranThukralViewController*)toViewController selectedLabelMenuFrame];
            newTitle.frame = menuItemFrame;
            newTitle.font = ((KaranThukralViewController*)toViewController).selectedLabelForTransitioning.font;
        }
        else {
            
            toViewController.view.alpha = 1.0f;
            fromViewController.view.alpha = 0.0f;
            newTitle.frame = CGRectMake(fromViewController.navigationController.view.frame.size.width/2 - newTitle.frame.size.width/2-1 , 31.5f, newTitle.frame.size.width, newTitle.frame.size.height);
            
        }
    } completion:^(BOOL finished) {
        
        if (!self.inReverse) {
            UILabel* titleLabel = [UILabel new];
            titleLabel.text = newTitle.text;
            titleLabel.font = newTitle.font;
            titleLabel.frame = newTitle.frame;
            toViewController.navigationItem.titleView = titleLabel;
            titleLabel.alpha = 0.0f;
        }
        
        [UIView animateWithDuration:0.2f delay:0.0f options:0 animations:^(void){
            if (self.inReverse) {
                toViewController.navigationItem.title = @"Karan Thukral";
                
            } else {
                
            }
        } completion:^(BOOL finished){
            if (self.inReverse) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    [menuItemPatch removeFromSuperview];
                    [newTitle removeFromSuperview];
                    
                });
            } else {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    toViewController.navigationItem.titleView.alpha = 1.0f;
                    [newTitle removeFromSuperview];
                    
                });
                
                
            }
            [background removeFromSuperview];
            
            
            [transitionContext completeTransition:finished];
            
        }];
    }];
}


@end
