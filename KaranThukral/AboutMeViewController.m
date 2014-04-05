//
//  AboutMeViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "AboutMeViewController.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

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
    
    self.navigationItem.title = @"Me";
    
    self.imageView.layer.cornerRadius = 12.0f;
    self.imageView.clipsToBounds = YES;
    
    self.topBackgroundView.layer.cornerRadius = 10.0f;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    
    self.textView.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    self.topBackgroundView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];

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

- (IBAction)emailMe:(id)sender {
}

- (IBAction)checkoutMyGit:(id)sender {
}

- (IBAction)checkoutMyWebsite:(id)sender {
}

- (IBAction)checkoutMyLinkedin:(id)sender {
}
@end
