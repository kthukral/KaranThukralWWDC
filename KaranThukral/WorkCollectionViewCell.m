//
//  WorkCollectionViewCell.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "WorkCollectionViewCell.h"

@implementation WorkCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)prepareForReuse {
    self.textView.text = @"";
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
