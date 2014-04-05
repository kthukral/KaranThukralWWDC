//
//  ProjectMasterCollectionViewCell.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "ProjectMasterCollectionViewCell.h"
#import "ProjectCollectionViewCell.h"

@implementation ProjectMasterCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.screenshotsCollectionView registerClass:[ProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCollectionViewCell"];
        self.screenshotsCollectionView.delegate = self;
        self.screenshotsCollectionView.dataSource = self;

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

- (void)setUpCellForProject:(NSString *)projectName{
    [self.screenshotsCollectionView registerClass:[ProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCollectionViewCell"];
    self.screenshotsCollectionView.delegate = self;
    self.screenshotsCollectionView.dataSource = self;
    self.titleLabel.layer.cornerRadius = 15.0f;
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0.52 green:0.71 blue:0.88 alpha:1];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *baseName = @"iPhone5_";
    baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
    ProjectCollectionViewCell *projectCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProjectCollectionViewCell" forIndexPath:indexPath];
    projectCell.imageView.image = [UIImage imageNamed:baseName];
    self.textView.text = @"Remembr! is the coolest app ever!";
    
    return projectCell;
}


@end
