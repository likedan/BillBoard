//
//  AddTeamViewController.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-20.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "AddTeamViewController.h"
#import "BillBoardDataManager.h"
#import "BillBoardJsonPasser.h"
#import "BillBoardAddBill.h"

@interface AddTeamViewController ()

@end

@implementation AddTeamViewController{
    UITapGestureRecognizer *keybordR;
    
    NSMutableArray *allInvited;
    NSMutableDictionary *userInfo;
    
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
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    userInfo = [BillBoardDataManager getUserInfoFromLocal];
    
    allInvited = [[NSMutableArray alloc] init];
    
    [self.back addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];

    [self.adddd addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    
    [self.addName addTarget:self action:@selector(addNamee) forControlEvents:UIControlEventTouchUpInside];


    UITextField *emailfield = [[UITextField alloc] initWithFrame:CGRectMake(70, 10, 230, 30)];
    [emailfield setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:23.0]];
    [emailfield setTextColor:[UIColor darkGrayColor]];
    [emailfield setText:[userInfo objectForKey:@"email"]];
    [emailfield setUserInteractionEnabled:NO];
    [emailfield setPlaceholder:@"email"];
    [emailfield setDelegate:self];
    [self.names addSubview:emailfield];
    
    [allInvited addObject:emailfield];
    
    emailfield = [[UITextField alloc] initWithFrame:CGRectMake(70, 50, 230, 30)];
    [emailfield setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:23.0]];
    [emailfield setTextColor:[UIColor darkGrayColor]];
    [emailfield setPlaceholder:@"email"];
    [emailfield setDelegate:self];
    [self.names addSubview:emailfield];
    
    [allInvited addObject:emailfield];

    keybordR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign:)];
    [keybordR setNumberOfTapsRequired:1];
    [keybordR setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:keybordR];
}

-(void)resign:(UITapGestureRecognizer*)reco{
    [self.groupName resignFirstResponder];
    for (int index = 1; index < [allInvited count]; index++) {
        [[allInvited objectAtIndex:index] resignFirstResponder];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField != self.groupName) {
        if ([allInvited indexOfObject:textField] < [allInvited count] - 1) {
            [textField resignFirstResponder];
            [[allInvited objectAtIndex:[allInvited indexOfObject:textField] + 1] becomeFirstResponder];
        }
    }
    return YES;
}

-(void)add{
    
    if (![self.groupName.text isEqual:@""]) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        
        for (int index = 0; index < [allInvited count]; index++) {
            if (![[[allInvited objectAtIndex:index] text] isEqualToString:@""]) {
                [arr addObject:[[allInvited objectAtIndex:index] text]];
            }
        }
        
       NSMutableDictionary *result = [BillBoardJsonPasser createGroup:[[allInvited objectAtIndex:0] text] :arr :self.groupName.text];
        if ([[result objectForKey:@"result"] isEqualToString:@"succ"]) {
            
            [self performSegueWithIdentifier:@"backToFunction" sender:self];
            
        }
    }
    
}

-(void)addNamee{
    
    UITextField *emailfield = [[UITextField alloc] initWithFrame:CGRectMake(70, 10 + [allInvited count] * 40, 230, 30)];
    [emailfield setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:23.0]];
    [emailfield setTextColor:[UIColor darkGrayColor]];
    [emailfield setPlaceholder:@"email"];
    [emailfield setDelegate:self];
    [self.names addSubview:emailfield];
    
    [allInvited addObject:emailfield];
    
}

- (void)goback{
    
    [self performSegueWithIdentifier:@"backToFunction" sender:self];
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
