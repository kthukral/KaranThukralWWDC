//
//  KTNavigationController.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTNavigationDelegate.h"

@interface KTNavigationController : UINavigationController {
    __strong KTNavigationDelegate* navigationDelegate;
}

@end
