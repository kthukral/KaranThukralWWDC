//
//  WorkViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-04.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "WorkViewController.h"
#import "WorkCollectionViewCell.h"

@interface WorkViewController ()

@end

@implementation WorkViewController

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
    self.navigationItem.title = @"Work";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WorkCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"workCell" forIndexPath:indexPath];
    
    //backgorund color
    cell.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    cell.textView.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    
    cell.textView.textAlignment = NSTextAlignmentJustified;
    cell.textView.textContainerInset = UIEdgeInsetsMake(1, 5, 1, 5);
    if (indexPath.row == 0) {
        cell.companyName.text = @"Shopify";
        cell.imageView.image = [UIImage imageNamed:@"shopify-bag-100x100.png"];
        cell.textView.text = @"I am going to be working at Shopify for the summer term as an iOS Developer primiraily on the iPhone application. The application enables the user to manage their online stores and also accept & process credit card transactions with the use of an additional iPhone accessory.";
    } else if (indexPath.row == 1){
        cell.companyName.text = @"Canadian Broadcasting Coorporation";
        cell.imageView.image = [UIImage imageNamed:@"CBC_transparent.png"];
        cell.textView.text = @"I worked at the Canadian Broadcasting Corporation for 4 months as an iOS Developer. I worked to recreate their news application in a completely native fashion using the iOS 7 SDK. This project involved using the new API's like Text Kit, and also creating a parser to parse HTML and dynamically layout views. This app was meant as a prototype for internal use and help determine the future direction of the apps that the company wanted to undertake. Screenshots of the application can be found on my website:";
        cell.textView.text = [cell.textView.text stringByAppendingString:@" http://www.karanthukral.me"];
    } else {
        cell.companyName.text = @"Kik Interactive";
        cell.imageView.image = [UIImage imageNamed:@"kikLogo.png"];
        cell.textView.text = @"I worked at Kik as a Mobile Testing Specialist for 4 months. The job included of manually conducting tests on the application for every feature and new release. I also worked on creating automated tests for Android using the Calabash Android Framework. Over my coop term I created two \"Kik Cards (web applications)\" \"Kik Your Memes\" and \"Kik Tech News\". I also started my iOS Development experience my creating sample applications like \"QTip\". All these applications are available on my GitHub: " @" http://github.com/kthukral";
    }
    
    return cell;
}



@end
