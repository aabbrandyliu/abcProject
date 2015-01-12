
//
//  RootViewController.m
//  NewProject
//
//  Created by 学鸿 张 on 13-11-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "QRRootViewController.h"
#import "CLPredefine.h"

@interface QRRootViewController ()

@end

@implementation QRRootViewController

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
    [self navigationConfig];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(55, 80, 210, 210)];
    imageView.image = [UIImage imageNamed:@"二维码-frame.png"];
    [self.view addSubview:imageView];
    
    CGRect tipFrame = CGRectMake(45, 310, 230, 20);
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:tipFrame];
    tipLabel.textColor = [UIColor orangeColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"请将二维码图案放在取景框内";
    
    [self.view addSubview: tipLabel];
    
    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 80, 220, 10)];
    _line.image = [UIImage imageNamed:@"扫描_10.png"];
    [self.view addSubview:_line];
    
     [self setupCamera];
}

- (void)navigationConfig
{
    //标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = @"扫一扫";
    label.font = [UIFont systemFontOfSize:22];
    
    self.navigationItem.titleView = label;
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(50, 80+2*num, 220, 10);
        if (2*num == 200) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(50, 80+2*num, 220, 10);
        if (num == 0) {
            upOrdown = NO;
        }
    }

}
-(void)backAction
{
    [timer invalidate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupCamera
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    NSArray *validTypes = _output.availableMetadataObjectTypes;
    if (![validTypes containsObject:AVMetadataObjectTypeQRCode]) {
        return;
    }
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    if ([self.preview superlayer]) {
        
        [self.preview removeFromSuperlayer];
        self.preview = nil;
    }
    
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //_preview.frame =CGRectMake(55,80,210,210);
    _preview.frame =CGRectMake(0,0,320 ,kScreenSize.height);
    [self.view.layer insertSublayer:self.preview atIndex:0];

    // Start
    [_session startRunning];
    
    //设置定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
							 target:(id)target
						   selector:(SEL)selector
							  frame:(CGRect)frame
							  image:(UIImage *)image
					   imagePressed:(UIImage *)imagePressed
					  darkTextColor:(BOOL)darkTextColor
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];
	if (darkTextColor)
	{
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	}
	else
	{
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:.0 topCapHeight:0.0];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:.0 topCapHeight:0.0];
	[button setBackgroundImage:newPressedImage forState:UIControlStateSelected];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button;
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
   
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    [timer invalidate];
    
    stringValue = [QRRootViewController replaceUnicode:stringValue];
    NSLog(@"二维码:%@",stringValue);
    
    [self scanSuccess:stringValue];
}

- (void)scanSuccess:(NSString *)scanString
{
    NSString *stringValue = scanString;
    
    if (stringValue) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫描成功" message:stringValue delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"前往",nil];
        [alert show];
    }
}

+ (NSString*) replaceUnicode:(NSString*)aUnicodeString

{
    
    NSString *tempStr1 = [aUnicodeString stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                           
                                                           mutabilityOption:NSPropertyListImmutable
                           
                                                                     format:NULL
                           
                                                           errorDescription:NULL];
    
    
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        [_session startRunning];
        [timer fire];
    } else {
        
        NSURL *url = [NSURL URLWithString: alertView.message];
        UIApplication *app = [UIApplication sharedApplication];
        if ([app canOpenURL:url]) {
            [app openURL:url];
        }
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
