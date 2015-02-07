//
//  AddTeamViewController.h
//  BillBoard
//
//  Created by Kedan Li on 14-9-20.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTeamViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UIScrollView *names;
@property(nonatomic, weak) IBOutlet UITextField *groupName;
@property(nonatomic, weak) IBOutlet UIButton *addName;

@property(nonatomic, weak) IBOutlet UIButton *adddd;
@property(nonatomic, weak) IBOutlet UIButton *back;

@end
