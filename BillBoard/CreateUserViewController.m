//
//  CreateUserViewController.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "CreateUserViewController.h"
#import "SATHackerUniversalAnimation.h"
#import "BillBoardJsonPasser.h"
#import "BillBoardDataManager.h"

@interface CreateUserViewController ()

@property(nonatomic, strong) IBOutlet UIButton *create;
@property(nonatomic, strong) IBOutlet UIButton *back;


@property(nonatomic, strong) IBOutlet UITextField *name;
@property(nonatomic, strong) IBOutlet UITextField *username;
@property(nonatomic, strong) IBOutlet UITextField *password;
@property(nonatomic, strong) IBOutlet UILabel *notice;


@end

@implementation CreateUserViewController{
    
    UITapGestureRecognizer *keybordR;
    
}

-(void)freeMemory{
    self.name = nil;
    self.password = nil;
    self.username = nil;
    self.notice = nil;

    self.create = nil;
    self.back = nil;
    
    keybordR = nil;
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
    
    
    self.back = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    [self.back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.back addTarget:self action:@selector(returnToMain) forControlEvents:UIControlEventTouchUpInside];
    [self.back setAlpha:0];
    [self.view addSubview:self.back];
    [SATHackerUniversalAnimation easyAlphaChange:self.back :0.5 :0 :1];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(360, 100, 200, 60)];
    [self.name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:30.0]];
    [self.name setTextColor:[UIColor grayColor]];
    [self.name setPlaceholder:@"Full Name"];
    [self.name setDelegate:self];
    [self.view addSubview:self.name];
    
    self.username = [[UITextField alloc] initWithFrame:CGRectMake(-200, 190, 200, 60)];
    [self.username setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:30.0]];
    [self.username setTextColor:[UIColor grayColor]];
    [self.username setPlaceholder:@"Username"];
    [self.username setDelegate:self];
    [self.view addSubview:self.username];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(360, 280, 200, 60)];
    [self.password setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:30.0]];
    [self.password setTextColor:[UIColor grayColor]];
    [self.password setPlaceholder:@"Password"];
    [self.password setSecureTextEntry:YES];
    [self.password setDelegate:self];
    [self.view addSubview:self.password];
    
    
    [SATHackerUniversalAnimation easyMove:self.name :0.5 :0 :60 : 100];
    [SATHackerUniversalAnimation easyMove:self.username :0.5 :0.1 :60 : 190];
    [SATHackerUniversalAnimation easyMove:self.password :0.5 :0.2 :60 : 280];
    
    keybordR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign:)];
    [keybordR setNumberOfTapsRequired:1];
    [keybordR setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:keybordR];
    
    self.create = [[UIButton alloc] initWithFrame:CGRectMake(60, 410, 200, 60)];
    [self.create addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.create];
    
    UILabel *loginLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [loginLab setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:40.0]];
    [loginLab setText:@"Sign Up"];
    [loginLab setBackgroundColor:[UIColor clearColor]];
    [loginLab setTextColor:[UIColor grayColor]];
    [loginLab setTextAlignment:NSTextAlignmentCenter];
    [self.create addSubview:loginLab];

    self.notice = [[UILabel alloc] initWithFrame:CGRectMake(60, 470, 200, 60)];
    [self.notice setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:20.0]];
    [self.notice setText:@""];
    [self.notice setBackgroundColor:[UIColor clearColor]];
    [self.notice setTextColor:[UIColor grayColor]];
    [self.notice setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.notice];
    
}

-(void)signUp{
    
    [self.notice setText:@""];
    
    if ([self.name.text isEqualToString:@""]||[self.username.text isEqualToString:@""]||[self.password.text isEqualToString:@""]) {
        [self.notice setText:@"*Field empty*"];
    }else{
        
        [self performSegueWithIdentifier:@"createSucc" sender:self];
        
        /*
        NSMutableDictionary * result = [BillBoardJsonPasser signUp :self.name.text :self.username.text :self.password.text];
        
        if ([[result objectForKey:@"result"] isEqualToString:@"succ"]) {
            
            NSMutableArray *save = [[NSMutableArray alloc] init];
            
        }else if([[result objectForKey:@"result"] isEqualToString:@"fail"]){
            [self.notice setText:@"*Server Error*"];
            
        }else{
            NSLog(@"loginning error");
        }
         */
    }

    
}

-(void)returnToMain{
    
    [self performSegueWithIdentifier:@"returnMain" sender:self];
    
}

-(void)resign:(UITapGestureRecognizer*)reco{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    [self.name resignFirstResponder];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.name) {
        [textField resignFirstResponder];
        [self.username becomeFirstResponder];
    }else if (textField == self.username) {
        [textField resignFirstResponder];
        [self.password becomeFirstResponder];
    }else if (textField == self.password) {
        [textField resignFirstResponder];
    }
    return YES;
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
