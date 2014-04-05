//
//  MainViewCells.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLeft;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewRight;
@end
