//
//  InformationStore.m
//  KaranThukral
//
//  Created by Karan Thukral on 2014-04-03.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "InformationStore.h"

@implementation InformationStore

+ (InformationStore *)sharedStore {
    static InformationStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil]init];
    }
    
    return sharedStore;
}

- (NSArray *)returnMainCategrories{
    NSArray *mainViewCatagories = [[NSArray alloc] initWithObjects:@"Me",@"Work",@"Projects", nil];
    //Check if stored on device, otherwise create
    return mainViewCatagories;
}
@end
