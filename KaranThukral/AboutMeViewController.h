//
//  AboutMeViewController.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface AboutMeViewController : UIViewController <MFMailComposeViewControllerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)emailMe:(id)sender;
- (IBAction)checkoutMyGit:(id)sender;
- (IBAction)checkoutMyWebsite:(id)sender;
- (IBAction)checkoutMyLinkedin:(id)sender;



@end
