//
//  FunctionViewController.h
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>  

@property(nonatomic, strong) IBOutlet UILabel *name;
@property(nonatomic, strong) IBOutlet UIButton *back;

@property(nonatomic, strong) IBOutlet UIButton *addGroup;
@property(nonatomic, strong) IBOutlet UITableView *groups;

@property(nonatomic, strong) IBOutlet UIImageView *verticalLine;



@end
