//
//  ProjectViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectCollectionViewCell.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView registerClass:[ProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCollectionViewCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    
    return projectCell;
}

@end
