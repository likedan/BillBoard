//
//  BillBoardJsonPasser.h
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillBoardJsonPasser : NSObject

+(NSMutableDictionary*)Login:(NSString *)username password:(NSString *)password;
+(NSMutableDictionary*)signUp :(NSString *)name :(NSString *)username :(NSString *)password;
+(NSMutableDictionary*)getBasicInfo :(NSString *)groupId;

+(NSMutableDictionary*)createGroup :(NSString *)name :(NSMutableArray *)username :(NSString *)groupName;

+(NSMutableDictionary*)getGroupInfo :(NSString *)groupId;


@end
