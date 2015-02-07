//
//  CheckGroupViewController.h
//  BillBoard
//
//  Created by Kedan Li on 14-9-20.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckGroupViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate>

@property(nonatomic, strong) NSString *groupID;
@property(nonatomic, strong) NSString *groupName;

@property(nonatomic, strong) IBOutlet UILabel *groupNameLab;
@property(nonatomic, strong) IBOutlet UIButton* members;
@property(nonatomic, strong) IBOutlet UIButton* add;
@property(nonatomic, strong) IBOutlet UILabel* memberNum;
@property(nonatomic, strong) IBOutlet UIButton* back;

@property(nonatomic, strong) IBOutlet UIScrollView *bills;


@end
