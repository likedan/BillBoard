//
//  SATHackerDataManager.m
//  SATHacker
//
//  Created by Kedan Li on 14-7-3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "BillBoardDataManager.h"
#import "Reachability.h"

@implementation BillBoardDataManager


+(void)initializeEveryPlist{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent: @"UserInformation.plist"];
    
    NSString *resource = [[NSBundle mainBundle]pathForResource:@"UserInfo" ofType:@"plist"];
    
    NSMutableDictionary *allContents = [[NSMutableDictionary alloc] initWithContentsOfFile:resource];
    NSString *encodedStr = [BillBoardDataManager encoding:allContents];

    [allContents removeAllObjects];
    [allContents setObject:encodedStr forKey:@"info"];
    [fileManager copyItemAtPath:resource toPath:database_path error:nil];
    [allContents writeToFile:database_path atomically:YES];

}

+(void)setUserInfo :(NSMutableDictionary*)dict{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent: @"UserInformation.plist"];
    NSMutableDictionary *allContents = [[NSMutableDictionary alloc] initWithContentsOfFile:database_path];
    [allContents setObject:[BillBoardDataManager encoding:dict] forKey:@"info"];
    [allContents writeToFile:database_path atomically:YES];
    
}

+(void)removeExistingUserInfo{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent: @"UserInformation.plist"];
    NSMutableDictionary *allContents = [[NSMutableDictionary alloc] initWithContentsOfFile:database_path];
    
    NSMutableDictionary *dict = [BillBoardDataManager decoding:[allContents objectForKey:@"info"]];
    
    NSArray *keys =  [dict allKeys];
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    for (int index = 0; index < [keys count]; index ++) {
        [result setObject:@"" forKey:[[keys objectAtIndex:index] mutableCopy]];
    }
    [allContents setObject:[BillBoardDataManager encoding:result] forKey:@"info"];
    [allContents writeToFile:database_path atomically:YES];

}


+(NSMutableDictionary*)getUserInfoFromLocal{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent: @"UserInformation.plist"];
    NSMutableDictionary *allContents = [[NSMutableDictionary alloc] initWithContentsOfFile:database_path];
    
    NSMutableDictionary *dict = [BillBoardDataManager decoding:[allContents objectForKey:@"info"]];
    
    return dict;
}


//加密
+(NSString*)encoding:(NSMutableDictionary*)dict{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *string = [[NSString alloc] initWithData:jsonData  encoding:NSUTF8StringEncoding];
    NSString *desStr = [DES encryptString:string];
    
    return desStr;
}

//解密
+(NSMutableDictionary*)decoding:(NSString*)str{
    
    NSString *desStr = [DES decryptString:str];
    
    NSData *data = [desStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *testDict = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingAllowFragments
                                                                      error:nil];
    return testDict;
}


@end
