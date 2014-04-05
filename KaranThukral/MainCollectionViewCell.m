//
//  MainViewCells.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"MainViewCell" owner:self options:nil];
        self = [nib objectAtIndex:0];
        self.imageViewRight.layer.cornerRadius = 20.0f;
        self.imageViewLeft.layer.cornerRadius = 20.0f;
    }
    return self;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
