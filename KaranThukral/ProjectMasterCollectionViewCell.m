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
    self.screenshotsCollectionView.hidden = NO;
    self.imageView.hidden = YES;
}

- (void)setUpCellForProject:(NSString *)projectName{
    
    self.projectName = projectName;
    self.titleLabel.text = projectName;
    
    self.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    self.textView.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    
    if ([self.projectName isEqualToString:@"Remembr!"]) {
        
        self.textView.text = @"A simple iOS application made using the iOS 7 SDK for iPhones and iPods. The application enables the user to create categories with custom icons and background colors to organize their notes.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@ \n%@",@"Website: http://www.remembrapp.com",@"App Store: https://itunes.apple.com/us/app/remembr!/id747470885?ls=1&mt=8", @"Git Repo: http://github.com/kthukral/Remembr"]];
        self.textView.textAlignment = NSTextAlignmentCenter;
        
    } else if ([self.projectName isEqualToString:@"CBC News"]){
        
        self.textView.text = @"Developed a prototype CBC News Application during my coop term. The application uses the CBC backend, iOS 7 SDK, MWPhotoBrowser and a self developed HTML parser to dynamically format and layout story pages.";
        self.textView.textAlignment = NSTextAlignmentCenter;
        
    } else if ([self.projectName isEqualToString:@"Kik Tech News"]){
        
        self.textView.text = @"A simple web app created using the Kik Cards platform that downloads the feeds from two technology website, The Verge and Engadget and you can read the stories and \"Kik\" them to your friends.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@",@"Website: kik-tech-news.herokuapp.com", @"Git Repo: http://github.com/kthukral/Kik-Tech-News"]];
        
        self.textView.textAlignment = NSTextAlignmentCenter;
        
    } else if ([self.projectName isEqualToString:@"Kik Your Memes"]) {
        
        self.textView.text = @"A simple web app created using the Kik Cards platform that enables you to pick an image from your camera or photo-gallery and add captions to them to create memes to \"Kik\" to your friends.";
        self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\n\n %@ \n%@",@"Website: http://kik-memes.herokuapp.com", @"Git Repo: http://github.com/kthukral/Kik-Your-Meme"]];
        
        self.textView.textAlignment = NSTextAlignmentCenter;
    } else if ([self.projectName isEqualToString:@"Team Dave"]) {
        self.screenshotsCollectionView.hidden = YES;
        self.imageView.hidden = NO;
        self.imageView.image = [UIImage imageNamed:@"TeamDave.jpg"];
        self.textView.text = @"I mentored a FIRST Robotics team at a high school in Waterloo, ON for the 2014 season. The game this year: https://www.youtube.com/watch?v=f5zWzICG5to . I along with the other mentors helped the students design, build, program the robot and also work on the community outreach and fund raising efforts. We have qualified for the World Championships at the end of April in St Louis, MO. \n" @"Website: http://www.teamdave.ca";
        self.textView.textAlignment = NSTextAlignmentCenter;
    }
    
    [self.screenshotsCollectionView registerClass:[ProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCollectionViewCell"];
    
    self.screenshotsCollectionView.delegate = self;
    self.screenshotsCollectionView.dataSource = self;

    [self.screenshotsCollectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if ([self.projectName isEqualToString:@"Remembr!"]) {
        return 5;
    } else if ([self.projectName isEqualToString:@"CBC News"]){
        return 8;
    } else {
        return 3;
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        ProjectCollectionViewCell *projectCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProjectCollectionViewCell" forIndexPath:indexPath];
        
        if ([self.projectName isEqualToString:@"Remembr!"]) {
            
            NSString *baseName = @"iPhone5_";
            baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".png"]];
            projectCell.imageView.image = [UIImage imageNamed:baseName];
            
        } else if ([self.projectName isEqualToString:@"CBC News"]){
            
            NSString *baseName = @"CBC";
            baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".PNG"]];
            projectCell.imageView.image = [UIImage imageNamed:baseName];
            
        } else if ([self.projectName isEqualToString:@"Kik Tech News"]){
            
            NSString *baseName = @"TechNews";
            baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".PNG"]];
            projectCell.imageView.image = [UIImage imageNamed:baseName];
            
        } else if ([self.projectName isEqualToString:@"Kik Your Memes"]) {
            
            NSString *baseName = @"Meme";
            baseName = [baseName stringByAppendingString:[NSString stringWithFormat:@"%d%@", indexPath.row+1,@".PNG"]];
            projectCell.imageView.image = [UIImage imageNamed:baseName];
            
        }
        
        return projectCell;

    
}


@end
