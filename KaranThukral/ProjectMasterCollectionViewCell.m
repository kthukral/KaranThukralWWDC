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

- (void)prepareForReuse {
    self.projectName = nil;
}

- (void)setUpCellForProject:(NSString *)projectName{
    self.projectName = projectName;
    self.titleLabel.text = projectName;
    [self.screenshotsCollectionView registerClass:[ProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCollectionViewCell"];
    self.screenshotsCollectionView.delegate = self;
    self.screenshotsCollectionView.dataSource = self;
    self.titleLabel.layer.cornerRadius = 15.0f;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.projectName isEqualToString:@"Remembr!"]) {
        return 5;
    } else if ([self.projectName isEqualToString:@"CBC News"]){
        return 8;
    } else if ([self.projectName isEqualToString:@"Kik Tech News"]){
        return 3;
    } else if ([self.projectName isEqualToString:@"Kik Your Memes"]){
        return 3;
    }
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProjectCollectionViewCell *projectCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProjectCollectionViewCell" forIndexPath:indexPath];
    
    if ([self.projectName isEqualToString:@"Remembr!"]) {
        NSString *baseName = @"iPhone5_";
        baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
        projectCell.imageView.image = [UIImage imageNamed:baseName];
        self.textView.text = @"A simple iOS application made using the iOS 7 SDK for iPhones and iPods. The application enables the user to create catagories with custom icons and background colours to organize their notes.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@ \n%@",@"Website: http://www.remembrapp.com",@"App Store: https://itunes.apple.com/us/app/remembr!/id747470885?ls=1&mt=8", @"Git Repo: http://hithub.com/kthukral/Remembr"]];
        self.textView.textAlignment = NSTextAlignmentCenter;
    } else if ([self.projectName isEqualToString:@"CBC News"]){
        NSString *baseName = @"CBC";
        baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
        projectCell.imageView.image = [UIImage imageNamed:baseName];
        self.textView.text = @"Developed a prototype CBC News Application during my coop term. The application uses the CBC backend, iOS 7 SDK, MWPhotoBrowser and a self developed HTML parser to dynamically format and layout story pages.";
        self.textView.textAlignment = NSTextAlignmentCenter;

    } else if ([self.projectName isEqualToString:@"Kik Tech News"]){
        NSString *baseName = @"TechNews";
        baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
        projectCell.imageView.image = [UIImage imageNamed:baseName];
        self.textView.text = @"A simple web app created using the Kik Cards platform that downloads the feeds from two technology website, The Verge and Engadget and you can read the stories and \"Kik\" them to your friends.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@",@"Website: http://www.kik-tech-news.herokuapp.com", @"Git Repo: http://hithub.com/kthukral/Kik-Tech-News"]];

        self.textView.textAlignment = NSTextAlignmentCenter;

    } else if ([self.projectName isEqualToString:@"Kik Your Memes"]) {
        NSString *baseName = @"Meme";
        baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
        projectCell.imageView.image = [UIImage imageNamed:baseName];
        self.textView.text = @"A simple web app created using the Kik Cards platform that enables you to pick an image from your camera or photo-gallery and add captions to them to create memes to \"Kik\" to your friends.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@",@"Website: http://www.kik-your-memes.herokuapp.com", @"Git Repo: http://hithub.com/kthukral/Kik-Your-Memes"]];
        
        self.textView.textAlignment = NSTextAlignmentCenter;
    }
    
    return projectCell;
}


@end