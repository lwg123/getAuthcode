//
//  LoginController.m
//  DPSDKTest
//
//  Created by xhw on 2018/11/27.
//  Copyright © 2018年 duia. All rights reserved.
//

#import "LoginController.h"
#import <DPSDKKIT/DPSDKKIT.h>
#import "ViewController.h"

@interface LoginController ()
- (IBAction)loginAction:(id)sender;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAction:(id)sender {
    //APP启动时 和 登录的时候传入user信息  退出时调用 [LivingRoomPush cleanUserInfo];
    
    LivingRoomPush.liveparams.userId = @(11326194);
    LivingRoomPush.liveparams.username = @"维阿219";
    LivingRoomPush.liveparams.userPicUrl = @"/headpic/app/head_2.png";
    LivingRoomPush.liveparams.userHasLogin = YES;
    LivingRoomPush.liveparams.userIsVip = YES;
    LivingRoomPush.liveparams.studentId = @(373126);
    LivingRoomPush.liveparams.studentName = @"真实姓名";
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [story instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
