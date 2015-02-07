//
//  BillBoardViewController.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//
#import "BillBoardJsonPasser.h"
#import "BillBoardViewController.h"
#import "SATHackerUniversalAnimation.h"
#import "BillBoardDataManager.h"


@interface BillBoardViewController ()

@property(nonatomic, strong) IBOutlet UIButton *back;

@property(nonatomic, strong) IBOutlet UIButton *login;
@property(nonatomic, strong) IBOutlet UIButton *createAccount;

@property(nonatomic, strong) IBOutlet UITextField *username;
@property(nonatomic, strong) IBOutlet UITextField *password;
@property(nonatomic, strong) IBOutlet UILabel *notice;

@end

@implementation BillBoardViewController{
    
    UITapGestureRecognizer *keybordR;
    
}

-(void)freeMemory{
    
    [self.back removeFromSuperview];
    [self.login removeFromSuperview];
    [self.createAccount removeFromSuperview];
    [self.username removeFromSuperview];
    [self.notice removeFromSuperview];
    [self.password removeFromSuperview];

    
    self.createAccount = nil;
    self.password = nil;
    self.username = nil;
    self.login = nil;
    self.notice = nil;
    self.back = nil;
    
    keybordR = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [BillBoardDataManager initializeEveryPlist];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    
    self.login = [[UIButton alloc] initWithFrame:CGRectMake(60, 170, 200, 60)];
    [self.login addTarget:self action:@selector(loginn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.login];
    
    UILabel *loginLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [loginLab setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:40.0]];
    [loginLab setText:@"Login"];
    [loginLab setBackgroundColor:[UIColor clearColor]];
    [loginLab setTextColor:[UIColor grayColor]];
    [loginLab setTextAlignment:NSTextAlignmentCenter];
    [self.login addSubview:loginLab];
    
    self.createAccount = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 200, 60)];
    [self.createAccount addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.createAccount];
    
    UILabel *SULab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [SULab setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:40.0]];
    [SULab setText:@"Sign Up"];
    [SULab setBackgroundColor:[UIColor clearColor]];
    [SULab setTextColor:[UIColor grayColor]];
    [SULab setTextAlignment:NSTextAlignmentCenter];
    [self.createAccount addSubview:SULab];
    
    self.notice = [[UILabel alloc] initWithFrame:CGRectMake(60, 450, 200, 60)];
    [self.notice setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:20.0]];
    [self.notice setText:@""];
    [self.notice setBackgroundColor:[UIColor clearColor]];
    [self.notice setTextColor:[UIColor grayColor]];
    [self.notice setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.notice];
    
}

-(void)loginn{
    
    [self.login removeTarget:self action:@selector(loginn) forControlEvents:UIControlEventTouchUpInside];
    [self.login addTarget:self action:@selector(loginingIn) forControlEvents:UIControlEventTouchUpInside];

    self.back = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    [self.back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.back addTarget:self action:@selector(returnToMain) forControlEvents:UIControlEventTouchUpInside];
    [self.back setAlpha:0];
    [self.view addSubview:self.back];
    [SATHackerUniversalAnimation easyAlphaChange:self.back :0.5 :0 :1];

    
    self.username = [[UITextField alloc] initWithFrame:CGRectMake(-200, 150, 200, 60)];
    [self.username setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:30.0]];
    [self.username setTextColor:[UIColor grayColor]];
    [self.username setPlaceholder:@"Email"];
    [self.username setDelegate:self];
    [self.view addSubview:self.username];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(360, 230, 200, 60)];
    [self.password setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:30.0]];
    [self.password setTextColor:[UIColor grayColor]];
    [self.password setPlaceholder:@"Pass"];
    [self.password setSecureTextEntry:YES];
    [self.password setDelegate:self];
    [self.view addSubview:self.password];
    
    keybordR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign:)];
    [keybordR setNumberOfTapsRequired:1];
    [keybordR setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:keybordR];
    
    [SATHackerUniversalAnimation bigToSmall:self :self.createAccount :@"createAccountRemove" :0.4 :0 ];
    
    [SATHackerUniversalAnimation easyMove:self.login :0.5 :0 :60 : 350];
    [SATHackerUniversalAnimation easyMove:self.username :0.5 :0 :60 : 150];
    [SATHackerUniversalAnimation easyMove:self.password :0.5 :0 :60 : 230];

    
}

-(void)resign:(UITapGestureRecognizer*)reco{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.username) {
        [textField resignFirstResponder];
        [self.password becomeFirstResponder];
    }else if (textField == self.password){
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)signUp{
    
    //[self performSegueWithIdentifier:@"loginSucc" sender:self];
    [self performSegueWithIdentifier:@"signUp" sender:self];
    [self freeMemory];
    
}

-(void)returnToMain{
    
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    
    [self.notice setText:@""];
    
    [self.login removeTarget:self action:@selector(loginingIn) forControlEvents:UIControlEventTouchUpInside];
    [self.login addTarget:self action:@selector(loginn) forControlEvents:UIControlEventTouchUpInside];
    
    [SATHackerUniversalAnimation easyAlphaChange:self.back :0.5 :0 :0];
    [SATHackerUniversalAnimation easyMove:self.login :0.5 :0 :60 :170];

    self.createAccount = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 200, 60)];
    [self.createAccount addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    [self.createAccount setAlpha:0];
    [self.view addSubview: self.createAccount];
    
    UILabel *SULab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [SULab setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:40.0]];
    [SULab setText:@"Sign Up"];
    [SULab setBackgroundColor:[UIColor clearColor]];
    [SULab setTextColor:[UIColor grayColor]];
    [SULab setTextAlignment:NSTextAlignmentCenter];
    [self.createAccount addSubview:SULab];

    [SATHackerUniversalAnimation easyAlphaChange:self.createAccount :0.4 :0.1 :1];
    
    [SATHackerUniversalAnimation easyMove:self.username :0.5 :0 :-200 : 150];
    [SATHackerUniversalAnimation easyMove:self.password :0.5 :0 :360 : 230];
}

//执行登陆

-(void)loginingIn{
    
    [self.notice setText:@""];

    if ([self.username.text isEqualToString:@""]||[self.password.text isEqualToString:@""]) {
        [self.notice setText:@"*Field empty*"];
    }else{
        
        //[self performSegueWithIdentifier:@"loginSucc" sender:self];
        

        NSMutableDictionary * result = [[BillBoardJsonPasser Login:self.username.text password:self.password.text] mutableCopy];
        
        if ([[result objectForKey:@"result"] isEqualToString:@"succ"]) {
            
            [result removeObjectForKey:@"result"];
            [BillBoardDataManager setUserInfo:result];
            
            [self performSegueWithIdentifier:@"loginSucc" sender:self];
            
        }else if([[result objectForKey:@"result"] isEqualToString:@"fail"]){
            [self.notice setText:@"*Invalid login*"];
            
        }else{
            NSLog(@"loginning error");
        }
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    if (anim == [self.createAccount.layer animationForKey:@"createAccountRemove"]) {
        [self.createAccount.layer removeAllAnimations];
        [self.createAccount removeFromSuperview];
        self.createAccount = nil;
    }

}

- (IBAction)dismissToMain:(UIStoryboardSegue *)segue {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
