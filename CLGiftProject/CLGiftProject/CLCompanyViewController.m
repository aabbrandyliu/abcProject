//
//  CLCompanyViewController.m
//  CLGiftProject
//
//  Created by xd on 15/1/6.
//  Copyright (c) 2015年 CLCompany. All rights reserved.
//

#import "CLCompanyViewController.h"
#import "QRRootViewController.h"

#import "UIButton+extras.h"
#import "CLPredefine.h"

@interface CLCompanyViewController ()

@end

@implementation CLCompanyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"yeyeyeyess");
    UIButton *bt = [UIButton createButtonWithFrame:CGRectMake((kScreenSize.width - 200)/2, 200, 200, 80) target:self selector:@selector(scanAction:) image:nil imagePressed:nil title:@"扫一扫" isDarkText:YES];
    [self.view addSubview:bt];
}

- (void)scanAction:(id)sender
{
    NSLog(@"这里是扫一扫");
    
    [self setupCamera];
}

-(void)setupCamera
{
    if(iOS7)
    {
        QRRootViewController *rt = [[QRRootViewController alloc]init];
        [self.navigationController pushViewController:rt animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
