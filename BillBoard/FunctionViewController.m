//
//  FunctionViewController.m
//  BillBoard
//
//  Created by Kedan Li on 14-9-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "FunctionViewController.h"
#import "BillBoardDataManager.h"
#import "SATHackerUniversalAnimation.h"
#import "Animations.h"
#import "BillBoardJsonPasser.h"
#import "BillBoardLogoutView.h"
#import "AddTeamViewController.h"
#import "CheckGroupViewController.h"


@interface FunctionViewController ()

@property(nonatomic, weak) IBOutlet BillBoardLogoutView *logoutView;
@property(nonatomic, weak) IBOutlet AddTeamViewController *addGroupView;

@end

@implementation FunctionViewController{
    
    NSMutableDictionary *userInfo;
    
    NSMutableArray *groupNames;
    
    NSString *selectedGroupID;
    
}

@synthesize verticalLine;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated{
    
    userInfo = [BillBoardDataManager getUserInfoFromLocal];
    
    groupNames = [[[userInfo objectForKey:@"groupList"] allKeys] mutableCopy];

    [self.back addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [SATHackerUniversalAnimation easyAlphaChange:self.back :0.5 :0 :1];

    [SATHackerUniversalAnimation easyAlphaChange:self.addGroup :0.5 :0 :1];


    [self.addGroup addTarget:self action:@selector(addAGroup) forControlEvents:UIControlEventTouchUpInside];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 280, 40)];
    [self.name setFont:[UIFont fontWithName:@"AvenirNext-Italic" size:30.0]];
    [self.name setText:[NSString stringWithFormat:@"%@'s Bills", [userInfo objectForKey:@"name"]]];
    [self.name setBackgroundColor:[UIColor clearColor]];
    [self.name setTextColor:[UIColor grayColor]];
    [self.name setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.name];
    
    self.groups = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, 320, 448) style:UITableViewStyleGrouped];
    [self.groups setDataSource:self];
    [self.groups setDelegate:self];
    [self.view addSubview: self.groups];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hhea");

    return 80;
}

-(void)addAGroup{
    
    [self performSegueWithIdentifier:@"AddTeamView" sender:self];

}



-(void)logout{

    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"logout" owner:nil options:nil];
    
    // Find the view among nib contents (not too hard assuming there is only one view in it).
    self.logoutView = [nibContents lastObject];
    [self.logoutView setAlpha:0];
    [self.logoutView.yes addTarget:self action:@selector(logoutting) forControlEvents:UIControlEventTouchUpInside];
    [self.logoutView.no addTarget:self action:@selector(notlogout) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.logoutView];
    
    [SATHackerUniversalAnimation easyAlphaChange:self.logoutView :0.5 :0 :0.88];
    
    
    
}

-(void)logoutting{
    [BillBoardDataManager removeExistingUserInfo];
    [self performSegueWithIdentifier:@"logout" sender:self];
}

-(void)notlogout{
    
    [SATHackerUniversalAnimation easyAlphaChange:self.logoutView :0.5 :0 :0];
    
}
//返回行数，也就是返回数组中所存储数据，也就是section的元素
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[userInfo objectForKey:@"groupList"] count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 为其定义一个标识符，在重用机制中，标识符非常重要，这是系统用来匹配table各行cell的判断标准，在以后的学习中会体会到
    static NSString *cellIdentifier = @"cellIdentifier";
    
    // 从缓存队列中取出复用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 如果队列中cell为空，即无复用的cell，则对其进行初始化
    if (cell==nil) {
        
        // 初始化
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        // 定义其辅助样式
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // 设置cell上文本内容
    UILabel *billName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [billName setFont:[UIFont fontWithName:@"AvenirNext-MediumItalic" size:28.0]];
    [billName setText:[[userInfo objectForKey:@"groupList"]objectForKey:[groupNames objectAtIndex:indexPath.row]]];
    [billName setBackgroundColor:[UIColor clearColor]];
    [billName setTextColor:[UIColor grayColor]];
    [billName setTextAlignment:NSTextAlignmentCenter];
    [cell addSubview:billName];
    
    //NSDictionary * amount = [BillBoardJsonPasser getBasicInfo:[groupNames objectAtIndex:indexPath.row]];
    
    UILabel *numberOfPeople = [[UILabel alloc] initWithFrame:CGRectMake(160, 50, 160, 30)];
    [numberOfPeople setFont:[UIFont fontWithName:@"AvenirNext-Italic" size:20.0]];
    //[numberOfPeople setText:[NSString stringWithFormat:@"%d people",[amount objectForKey:@"peoplenum"]]];
    [numberOfPeople setText:[NSString stringWithFormat:@"6 people"]];
    [numberOfPeople setBackgroundColor:[UIColor clearColor]];
    [numberOfPeople setTextColor:[UIColor lightGrayColor]];
    [numberOfPeople setTextAlignment:NSTextAlignmentRight];
    [cell addSubview:numberOfPeople];
    
    UILabel *totalAmount = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 250, 30)];
    [totalAmount setFont:[UIFont fontWithName:@"AvenirNext-Italic" size:20.0]];
    //[totalAmount setText:[NSString stringWithFormat:@"Amount: $%@",[amount objectForKey:@"amount"]]];
    [totalAmount setText:[NSString stringWithFormat:@"Amount: $342.00"]];
    [totalAmount setBackgroundColor:[UIColor clearColor]];
    [totalAmount setTextColor:[UIColor lightGrayColor]];
    [totalAmount setTextAlignment:NSTextAlignmentLeft];
    [cell addSubview:totalAmount];
    
    
    NSLog(@"hehe");

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedGroupID = [groupNames objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"checkGroup" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [SATHackerUniversalAnimation easyMove:self.verticalLine : 0.4:0 :50 :50];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"checkGroup"]) {
        
        CheckGroupViewController *controller = segue.destinationViewController;
        controller.groupID = selectedGroupID;
        controller.groupName = [[userInfo objectForKey:@"groupList"] objectForKey:selectedGroupID];

    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)dismissToFunction:(UIStoryboardSegue *)segue {
    
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
