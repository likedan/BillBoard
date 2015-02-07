//
//  CheckGroupViewController.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-20.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "CheckGroupViewController.h"
#import "BillBoardJsonPasser.h"
#import "BillBoardDataManager.h"
#import "BillBoardAddBill.h"
#import "SATHackerUniversalAnimation.h"

@interface CheckGroupViewController ()

@property(nonatomic, strong) IBOutlet BillBoardAddBill *billBoardd;

@end

@implementation CheckGroupViewController{
    
    NSMutableDictionary *userInfo;
    NSMutableDictionary *groupInfo;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    userInfo = [BillBoardDataManager getUserInfoFromLocal];
    groupInfo = [[BillBoardJsonPasser getGroupInfo:self.groupID] mutableCopy];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    [self.groupNameLab setText:self.groupName];
    
    [self.back addTarget:self action:@selector(returnToFunction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.memberNum setText:[NSString stringWithFormat:@"%d members",[[groupInfo objectForKey:@"users"] count]]];
    
    [self.members addTarget:self action:@selector(showUserList) forControlEvents:UIControlEventTouchUpInside];
    
    [self.add addTarget:self action:@selector(addBilli) forControlEvents:UIControlEventTouchUpInside];

    
    double height = 0;

    for (int index = 0; index < [[groupInfo objectForKey:@"bills"] count] ; index++) {
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, height, 230, 30)];
        [name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:20.0]];
        [name setText:[[[groupInfo objectForKey:@"bills"] objectAtIndex:index] objectForKey:@"name"]];
        [name setBackgroundColor:[UIColor clearColor]];
        [name setTextColor:[UIColor darkGrayColor]];
        [name setTextAlignment:NSTextAlignmentLeft];
        [name setEnabled:NO];
        [self.bills addSubview:name];
        
        height = height + 30;
        
        UILabel *person = [[UILabel alloc] initWithFrame:CGRectMake(0, height, 230, 18)];
        [person setFont:[UIFont fontWithName:@"AvenirNext-Italic" size:15.0]];
        [person setText:[NSString stringWithFormat:@"by %@",[[[groupInfo objectForKey:@"bills"] objectAtIndex:index] objectForKey:@"sponsor"]]];
        [person setBackgroundColor:[UIColor clearColor]];
        [person setTextColor:[UIColor darkGrayColor]];
        [person setTextAlignment:NSTextAlignmentLeft];
        [person setEnabled:NO];
        [self.bills addSubview:person];
        
        height = height + 18;

        UITextView* sizingView = [[UITextView alloc] init];
        sizingView.text = [NSString stringWithFormat:@"%@",[[[groupInfo objectForKey:@"bills"] objectAtIndex:index] objectForKey:@"description"]];
        [sizingView setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:17.0]];
        CGSize contentSize = [sizingView sizeThatFits:CGSizeMake(270, FLT_MAX)];
        
        UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(0, height, 270, contentSize.height)];
        [description setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:15.0]];
        [description setText:sizingView.text];
        [description setBackgroundColor:[UIColor clearColor]];
        [description setTextColor:[UIColor darkGrayColor]];
        [description setTextAlignment:NSTextAlignmentLeft];
        [description setEditable:NO];
        [self.bills addSubview:description];
        
        height = height + contentSize.height;
        
        UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(0, height, 270, 15)];
        [time setFont:[UIFont fontWithName:@"AvenirNext-Italic" size:13.0]];
        [time setText:[NSString stringWithFormat:@"%@",[[[groupInfo objectForKey:@"bills"] objectAtIndex:index] objectForKey:@"time"]]];
        [time setBackgroundColor:[UIColor clearColor]];
        [time setTextColor:[UIColor lightGrayColor]];
        [time setTextAlignment:NSTextAlignmentRight];
        [time setEnabled:NO];
        [self.bills addSubview:time];
        
        height = height + 15;
        
        UIImageView *blackLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, 277, 1)];
        [blackLine setBackgroundColor:[UIColor darkGrayColor]];
        [self.bills addSubview:blackLine];
        
        height ++;
        
        UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(0, height, 270, 25)];
        [money setFont:[UIFont fontWithName:@"AvenirNext-HeavyItalic" size:20.0]];
        [money setText:[NSString stringWithFormat:@"$%@",[[[groupInfo objectForKey:@"bills"] objectAtIndex:index] objectForKey:@"money"]]];
        [money setBackgroundColor:[UIColor clearColor]];
        [money setTextColor:[UIColor darkGrayColor]];
        [money setTextAlignment:NSTextAlignmentLeft];
        [money setEnabled:NO];
        [self.bills addSubview:money];
        
        height = height + 35;
    }
    
    [self.bills setContentSize:CGSizeMake(277, height)];

    
}

-(void)returnToFunction{
    
    [self performSegueWithIdentifier:@"backToFunction" sender:self];
    
}

-(void)addBilli{
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"addBill" owner:nil options:nil];
    
    // Find the view among nib contents (not too hard assuming there is only one view in it).
    self.billBoardd = [nibContents lastObject];
    [self.billBoardd setAlpha:0];
    [self.billBoardd.back addTarget:self action:@selector(backToMain) forControlEvents:UIControlEventTouchUpInside];
    [self.billBoardd.add addTarget:self action:@selector(addBl) forControlEvents:UIControlEventTouchUpInside];
    self.billBoardd.title.delegate = self;
    self.billBoardd.price.delegate = self;
    self.billBoardd.description.delegate = self;
    
    [self.view addSubview:self.billBoardd];
    
    [SATHackerUniversalAnimation easyAlphaChange:self.billBoardd :0.5 :0 :1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
