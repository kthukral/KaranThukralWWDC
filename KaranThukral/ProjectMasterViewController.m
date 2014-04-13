//
//  ProjectMasterViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "ProjectMasterViewController.h"
#import "ProjectMasterCollectionViewCell.h"

@interface ProjectMasterViewController ()

@end

@implementation ProjectMasterViewController

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
    [self.navigationItem setTitle:@"Projects"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProjectMasterCollectionViewCell *project = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProjectMasterCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [project setUpCellForProject:@"Remembr!"];
    } else if (indexPath.row == 1){
        [project setUpCellForProject:@"CBC News"];
    } else if (indexPath.row == 2){
        [project setUpCellForProject:@"Kik Tech News"];
    } else if (indexPath.row == 3){
        [project setUpCellForProject:@"Kik Your Memes"];
    } else {
        [project setUpCellForProject:@"Team Dave"];
    }
    return project;
}


@end
