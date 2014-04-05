//
//  InformationStore.h
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationStore : NSObject

+ (InformationStore *)sharedStore;

- (NSArray *)returnMainCategrories;

@end
