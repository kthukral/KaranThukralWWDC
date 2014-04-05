//
//  ProjectMasterCollectionViewCell.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectMasterCollectionViewCell : UICollectionViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *screenshotsCollectionView;

- (void)setUpCellForProject:(NSString *)projectName;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
