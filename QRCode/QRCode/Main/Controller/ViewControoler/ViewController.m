//
//  ViewController.m
//  QRCode
//
//  Created by ZHK on 2017/2/23.
//  Copyright © 2017年 Weiyu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+QRCode.h"
#import "ZHKQRCodeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage QRCodeWithCodeText:@"Do any additional setup after loading the view, typically from a nib." imageSize:200];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    
    imageView.center = self.view.center;
    
    NSLog(@"message = %@", [image QRCodeMessgae]);
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushScanVC:)];
    self.navigationItem.rightBarButtonItem = item;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 必须真机
- (void)pushScanVC:(UIBarButtonItem *)item {
    ZHKQRCodeViewController *qrVC = [[ZHKQRCodeViewController alloc] init];
    [self presentViewController:qrVC animated:YES completion:nil];
}


@end
