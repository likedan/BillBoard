//
//  BillBoardAddBill.h
//  BillBoard
//
//  Created by Kedan Li on 14-9-20.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillBoardAddBill : UIView

@property(nonatomic, weak) IBOutlet UIButton *back;
@property(nonatomic, weak) IBOutlet UIButton *add;


@property(nonatomic, weak) IBOutlet UITextField *title;
@property(nonatomic, weak) IBOutlet UITextField *price;

@property(nonatomic, weak) IBOutlet UITextView *description;

@end
