//
//  AboutMeViewController.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AnimatedCustomTransition.h"

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
}

- (IBAction)emailMe:(id)sender {
    
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate = self;
        [mailComposer setToRecipients:[NSArray arrayWithObjects: @"mail@karanthukral.me",nil]];
        [mailComposer setMessageBody:@"" isHTML:NO];
        [self presentViewController:mailComposer animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Mail Setup" message:@"Opps, looks like no mail account is setup. You can set up an account in settings or email me at mail@karanthukral.me" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    
}

- (IBAction)checkoutMyGit:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.github.com/kthukral"]];
}

- (IBAction)checkoutMyWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.karanthukral.me"]];
}

- (IBAction)checkoutMyLinkedin:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://ca.linkedin.com/in/thukralk/"]];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController*)fromVC toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return [AnimatedCustomTransition new];
    }
    
    return nil;
}

@end
