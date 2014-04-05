//
//  ProjectCollectionViewCell.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "ProjectCollectionViewCell.h"

@implementation ProjectCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [super initWithFrame:frame];
        if (self) {
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ProjectCollectionViewCell" owner:self options:nil];
            self = [nib objectAtIndex:0];    }
        return self;

    }
    return self;
}

- (void)prepareForReuse{
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
