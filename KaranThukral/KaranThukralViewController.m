//
//  KaranThukralViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "KaranThukralViewController.h"
#import "MainCollectionViewCell.h"
#import "MainCollectionViewCelliPad.h"
#import "InformationStore.h"
#import "AboutMeViewController.h"
#import "WorkViewController.h"
#import "ProjectMasterViewController.h"

@interface KaranThukralViewController ()

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@end

@implementation KaranThukralViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpCollectionView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpCollectionView {
    [self.navigationItem setTitle:@"Karan Thukral"];
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    CGFloat requiredHeight = mainScreen.size.height;
    CGRect collectionViewFrame = CGRectMake(0, 60, mainScreen.size.width, requiredHeight);
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:collectionViewFrame collectionViewLayout:self.layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.layout.itemSize = CGSizeMake(self.view.frame.size.width, 321.5);
        [self.collectionView registerClass:[MainCollectionViewCelliPad class] forCellWithReuseIdentifier:@"MainCollectionViewCelliPad"];
    } else {
        self.layout.itemSize = CGSizeMake(320, 170);
        [self.collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainViewCell"];
    }
    self.layout.sectionInset = UIEdgeInsetsMake(0,0,0,0); //no spacing between the cells
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    
    [self.view addSubview:self.collectionView];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[[InformationStore sharedStore] returnMainCategrories] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *catagoriesArray = [[InformationStore sharedStore] returnMainCategrories];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        MainCollectionViewCelliPad *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCelliPad" forIndexPath:indexPath];
        
        if ([catagoriesArray[indexPath.row] isEqualToString:@"Me"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.18 green:0.57 blue:0.84 alpha:1];
            cell.imageViewLeft.contentMode = UIViewContentModeScaleAspectFit;
            cell.imageViewLeft.image = [UIImage imageNamed:@"shopify-bag-100x100.png"];
            cell.imageViewRight.hidden = YES;
        } else if ([catagoriesArray[indexPath.row] isEqualToString:@"Work"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.75 green:0.22 blue:0.16 alpha:1];
            cell.imageViewRight.contentMode = UIViewContentModeScaleAspectFit;
            cell.imageViewRight.image = [UIImage imageNamed:@"shopify-bag-100x100.png"];
            cell.imageViewLeft.hidden = YES;
        } else if ([catagoriesArray[indexPath.row] isEqualToString:@"Projects"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.22 green:0.34 blue:0.6 alpha:1];
            cell.imageViewLeft.contentMode = UIViewContentModeRedraw;
            cell.imageViewLeft.image = [UIImage imageNamed:@"RemembrIcon@2x.png"];
            cell.imageViewRight.hidden = YES;
        }
        
        [cell.titleLabel setText:catagoriesArray[indexPath.row]];
        return cell;

    } else {
        
        MainCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MainViewCell" forIndexPath:indexPath];
        
        if ([catagoriesArray[indexPath.row] isEqualToString:@"Me"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.18 green:0.57 blue:0.84 alpha:1];
            cell.imageViewLeft.contentMode = UIViewContentModeScaleAspectFit;
            cell.imageViewLeft.image = [UIImage imageNamed:@"shopify-bag-100x100.png"];
            cell.imageViewRight.hidden = YES;
        } else if ([catagoriesArray[indexPath.row] isEqualToString:@"Work"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.75 green:0.22 blue:0.16 alpha:1];
            cell.imageViewRight.contentMode = UIViewContentModeScaleAspectFit;
            cell.imageViewRight.image = [UIImage imageNamed:@"shopify-bag-100x100.png"];
            cell.imageViewLeft.hidden = YES;
        } else if ([catagoriesArray[indexPath.row] isEqualToString:@"Projects"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.22 green:0.34 blue:0.6 alpha:1];
            cell.imageViewLeft.contentMode = UIViewContentModeRedraw;
            cell.imageViewLeft.image = [UIImage imageNamed:@"RemembrIcon@2x.png"];
            cell.imageViewRight.hidden = YES;
        }
        
        [cell.titleLabel setText:catagoriesArray[indexPath.row]];
        return cell;

    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[MainCollectionViewCelliPad class]] || [cell isKindOfClass:[MainCollectionViewCell class]]) {
        
        MainCollectionViewCell *mainCell = (MainCollectionViewCell *)cell;
        
        self.selectedLabelForTransitioning = mainCell.titleLabel;
        CGPoint labelPositionInCollectionView = CGPointMake(self.selectedLabelForTransitioning.frame.origin.x, mainCell.frame.origin.y);
        CGPoint absPosition = [self.collectionView convertPoint:labelPositionInCollectionView toView:self.navigationController.view];
        
        self.selectedLabelNavigationFrame = CGRectMake(absPosition.x, absPosition.y, self.selectedLabelForTransitioning.frame.size.width, self.selectedLabelForTransitioning.frame.size.height);
        
        CGPoint labelPositionInTableView_menu = CGPointMake(self.selectedLabelForTransitioning.frame.origin.x,
                                                            mainCell.frame.origin.y+self.collectionView.contentOffset.y+64);
        CGPoint absolutePosition_menu = [self.collectionView convertPoint:labelPositionInTableView_menu toView:self.navigationController.view];
        
        self.selectedLabelMenuFrame = CGRectMake(absolutePosition_menu.x, absolutePosition_menu.y, self.selectedLabelForTransitioning.frame.size.width, self.selectedLabelForTransitioning.frame.size.height);
        
        UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            myStoryBoard = [UIStoryboard storyboardWithName:@"Main-iPad" bundle:nil];
        }
        if ([mainCell.titleLabel.text isEqualToString: @"Me"]) {
            AboutMeViewController *aboutMe = [myStoryBoard instantiateViewControllerWithIdentifier:@"aboutMe"];
            
            [self.navigationController pushViewController:aboutMe animated:YES];
        } else if([mainCell.titleLabel.text isEqualToString: @"Work"]){
            WorkViewController *workView = [myStoryBoard instantiateViewControllerWithIdentifier:@"workView"];
            [self.navigationController pushViewController:workView animated:YES];
        } else {
            ProjectMasterViewController *projectView = [myStoryBoard instantiateViewControllerWithIdentifier:@"projectMasterView"];
            [self.navigationController pushViewController:projectView animated:YES];
        }
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
