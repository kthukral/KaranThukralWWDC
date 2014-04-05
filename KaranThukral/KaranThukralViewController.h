//
//  KaranThukralViewController.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KaranThukralViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    
    CGRect seletectedCellFrame;
}

@property (assign) CGRect selectedLabelNavigationFrame;
@property (assign) CGRect selectedLabelMenuFrame;
@property (strong, nonatomic) UILabel* selectedLabelForTransitioning;
@property (assign) CGRect selectedLabelInLineFrame;

@end
