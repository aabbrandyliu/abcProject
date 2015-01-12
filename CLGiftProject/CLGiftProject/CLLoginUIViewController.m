//
//  CLLoginUIViewController.m
//  CLGiftProject
//
//  Created by chenglei on 15/1/12.
//  Copyright (c) 2015年 CLCompany. All rights reserved.
//

#import "CLLoginUIViewController.h"
#import "CLPublic.h"

@interface CLLoginUIViewController ()
{
    UITextField *userNameTextField;
    UITextField *pwdTextField;
    UIButton *loginBtn;
}

@end

@implementation CLLoginUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loginView];
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginView
{
    userNameTextField=[[UITextField alloc] initWithFrame:CGRectMake(20,70,220,35)];
    [userNameTextField setBackgroundColor:[UIColor whiteColor]];
    userNameTextField.placeholder=@" 用户名";
    userNameTextField.delegate = self;
    userNameTextField.layer.cornerRadius = 3.0;
    [userNameTextField.layer setBorderWidth:1.0]; //边框宽度
    userNameTextField.layer.borderColor=[CLPublic getColor:@"#c3c3c3"].CGColor;
    [self.view addSubview:userNameTextField];
    
    //
    pwdTextField=[[UITextField alloc] initWithFrame:CGRectMake(20,120,220,35)];
    [pwdTextField setBackgroundColor:[UIColor whiteColor]];
    pwdTextField.tag = 802;
    pwdTextField.placeholder=@" 密码";
    pwdTextField.delegate = self;
    [pwdTextField setSecureTextEntry:YES];
    pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwdTextField.layer.cornerRadius = 3.0;
    [pwdTextField.layer setBorderWidth:1.0]; //边框宽度
    pwdTextField.layer.borderColor=[CLPublic getColor:@"#c3c3c3"].CGColor;
    [self.view addSubview:pwdTextField];
    
    //
    
    loginBtn=[[UIButton alloc] initWithFrame:CGRectMake(140,200,100,40)];
    [loginBtn setBackgroundColor:[CLPublic getColor:@"#00c98e"]];
    loginBtn.layer.cornerRadius = 3.0;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.tag = 200;
    [loginBtn addTarget:self action:@selector(doLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}
- (void)doLogin:(UIButton*)btn
{
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
