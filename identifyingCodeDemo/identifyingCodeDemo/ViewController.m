//
//  ViewController.m
//  identifyingCodeDemo
//
//  Created by weiguang on 16/9/6.
//  Copyright © 2016年 weiguang. All rights reserved.
//

#import "ViewController.h"
#import "AuthcodeView.h"

@interface ViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    AuthcodeView *authCodeView;
    UITextField *_input;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];    //显示验证码界面
    authCodeView = [[AuthcodeView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 40)];
    [self.view addSubview:authCodeView];    //提示文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, self.view.frame.size.width-100, 40)];
    label.text = @"点击图片换验证码";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];    //添加输入框
    _input = [[UITextField alloc] initWithFrame:CGRectMake(30, 220, self.view.frame.size.width-60, 40)];
    _input.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _input.layer.borderWidth = 2.0;
    _input.layer.cornerRadius = 5.0;
    _input.font = [UIFont systemFontOfSize:21];
    _input.placeholder = @"请输入验证码!";
    _input.clearButtonMode = UITextFieldViewModeWhileEditing;
    _input.backgroundColor = [UIColor clearColor];
    _input.textAlignment = NSTextAlignmentCenter;
    _input.returnKeyType = UIReturnKeyDone;
    _input.delegate = self;
    [self.view addSubview:_input];
    
}

#pragma mark 输入框代理，点击return 按钮

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //判断输入的是否为验证图片中显示的验证码
    if ([_input.text isEqualToString:authCodeView.authCodeStr]) {
        //正确弹出警告款提示正确
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"恭喜您 ^o^" message:@"验证成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alview show];
    }
    else {
        //验证不匹配，验证码和输入框抖动
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        anim.repeatCount = 1;
        anim.values = @[@-20,@20,@-20];
        [_input.layer addAnimation:anim forKey:nil];
    }
    return YES;
}
#pragma mark 警告框中方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //清空输入框内容，收回键盘
    if (buttonIndex==0)     {
        _input.text = @"";
        [_input resignFirstResponder];
    }
}



@end
