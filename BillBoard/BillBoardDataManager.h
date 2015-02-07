//
//  SATHackerDataManager.h
//  SATHacker
//
//  Created by Kedan Li on 14-7-3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DES.h"

@interface BillBoardDataManager : NSObject

+(void)initializeEveryPlist;

+(void)setUserInfo :(NSMutableDictionary*)dict;

+(void)removeExistingUserInfo;

+(NSMutableDictionary*)getUserInfoFromLocal;

@end
