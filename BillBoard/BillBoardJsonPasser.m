//
//  BillBoardJsonPasser.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#define URL @"http://172.17.62.96/billboard/mblogin.php"


#import "BillBoardJsonPasser.h"
#import "ASIHTTPRequest.h"

@implementation BillBoardJsonPasser

+(NSMutableDictionary*)Login:(NSString *)username password:(NSString *)password
{
    NSMutableDictionary *result;// 返回的 JSON 数据
    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"login", @"request", password, @"password",username,@"username",nil];
    if ([NSJSONSerialization isValidJSONObject:userDictionary])
    {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:URL];
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSLog(@"Test：%@",response);
            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            id jsonObject = [NSJSONSerialization
                             JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                             error:&error];
            result = (NSMutableDictionary *)jsonObject;
        }
    }
    
    return result;

}

+(NSMutableDictionary*)signUp :(NSString *)name :(NSString *)username :(NSString *)password
{
    NSMutableDictionary *result;// 返回的 JSON 数据
    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"login", @"request", password, @"password",username,@"username", name,@"name",nil];
    if ([NSJSONSerialization isValidJSONObject:userDictionary])
    {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:URL];
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSLog(@"Test：%@",response);
            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            id jsonObject = [NSJSONSerialization
                             JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                             error:&error];
            result= (NSMutableDictionary *)jsonObject;
        }
    }
    
    return result;
    
}

+(NSMutableDictionary*)getBasicInfo :(NSString *)groupId
{
    NSMutableDictionary *result;// 返回的 JSON 数据
    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"getgroupbasicinfo", @"request", groupId, @"groupid",nil];
    if ([NSJSONSerialization isValidJSONObject:userDictionary])
    {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:URL];
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSLog(@"Test：%@",response);
            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            id jsonObject = [NSJSONSerialization
                             JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                             error:&error];
            result = (NSMutableDictionary *)jsonObject;
        }
    }
    
    return result;
    
}

+(NSMutableDictionary*)createGroup :(NSString *)name :(NSMutableArray *)memberlist :(NSString *)groupName{
    
    NSMutableDictionary *result;// 返回的 JSON 数据
    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"creategroup", @"request", name, @"sponsor",groupName, @"groupname", memberlist, @"memberlist",nil];
    
    if ([NSJSONSerialization isValidJSONObject:userDictionary])
    {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:@"http://12.17.49.243/Billboard/groups/statement.php"];
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSLog(@"Test：%@",response);
            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            id jsonObject = [NSJSONSerialization
                             JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                             error:&error];
            result = (NSMutableDictionary *)jsonObject;
        }
    }
    
    return result;
    
}

+(NSMutableDictionary*)getGroupInfo :(NSString *)groupId{
    
    NSMutableDictionary *result;// 返回的 JSON 数据
    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"getgroupinfo", @"request",  groupId, @"groupid",nil];
    
    if ([NSJSONSerialization isValidJSONObject:userDictionary])
    {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:@"http://12.17.49.243/Billboard/groups/statement.php"];
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSLog(@"Test：%@",response);
            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            id jsonObject = [NSJSONSerialization
                             JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                             error:&error];
            result = (NSMutableDictionary *)jsonObject;
        }
    }
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    NSDictionary *User1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"kedant",(@"name"),@"likedan5@hotmail.com",(@"email"), nil];
    NSDictionary *User2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"zhiye",(@"name"),@"zhiye@hotmail.com",(@"email"), nil];
    [users addObject:User1];
    [users addObject:User2];
    
    NSMutableArray *bills = [[NSMutableArray alloc] init];

    NSDictionary *bill1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"The fee for college",(@"name"),@"kedan",(@"sponsor"),@"90.32",(@"money"), @"2014-07-16T10:19:22Z",(@"time"), @"Bill.com works with your accounting software to eliminate paperwork, save time and save money.",(@"description"),nil];
    NSDictionary *bill2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Buying an new Iphone",(@"name"),@"James",(@"sponsor"),@"1293.10",(@"money"), @"2014-06-23T10:19:22Z",(@"time"), @"Slash the time you spend on bill approvals and payments by 50%",(@"description"),nil];
    NSDictionary *bill3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Food for the Party",(@"name"),@"Parse",(@"sponsor"),@"133.22",(@"money"), @"2014-04-26T10:19:22Z",(@"time"),@"Accept payments by ACH and credit card, get paid 2—3X faster",(@"description"),nil];

    [bills addObject: bill1];
    [bills addObject: bill2];
    [bills addObject: bill3];
    
    result = [[NSMutableDictionary alloc] initWithObjectsAndKeys:bills,(@"bills"), users, (@"users"), nil];

    
    return result;
    
}

@end

/*
if ([jsonData length] > 0 && error == nil){
    NSLog(@"已把字典成功序列化.");
    //把json数据转化为String类型
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"JSON String = %@", jsonString);
    
    //把 JSON 数据转化成 Arrays 或者 Dictionaries
    //反序列化。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    id jsonObject = [NSJSONSerialization
                     JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments
                     error:&error];
    if (jsonObject != nil && error == nil){
        NSLog(@"反序列化成功...");
        if ([jsonObject isKindOfClass:[NSDictionary class]]){
            NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
            NSLog(@"反序列化后的dictionary数据 = %@", deserializedDictionary);
        }
        else if ([jsonObject isKindOfClass:[NSArray class]]){
            NSArray *deserializedArray = (NSArray *)jsonObject;
            NSLog(@"反序列化json后的数组 = %@", deserializedArray);
        }else {
            
        }
        
    }else if (error != nil){
        NSLog(@"反序列化时发生一个错误");
    }
    */