//
//  WorkCollectionViewCell.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
