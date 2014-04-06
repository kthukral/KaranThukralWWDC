//
//  KaranThukralViewController.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KaranThukralViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate>

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* percentInteractionController;
@property (nonatomic, assign) BOOL canPush;

@end
