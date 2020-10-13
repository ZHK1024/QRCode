//
//  ZHKViewController.m
//  ZHKQRCode
//
//  Created by Ruris on 09/29/2020.
//  Copyright (c) 2020 Ruris. All rights reserved.
//

#import "ZHKViewController.h"
#import <ZHKQRCode.h>

@interface ZHKViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生成黑白二维码
    UIImage *img = [UIImage QRCodeWithCodeText:@"http://zhk1024.com" imageSize:200];
    // 转换为彩色二维码
    _imageView.image = [UIImage imageBlackToTransparent:img withRed:225 andGreen:64 andBlue:63];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushScanVC:)];
    self.navigationItem.rightBarButtonItem = item;
    
    
    
    UIImage *image = [UIImage imageNamed:@"bbb.png"];
  
    NSString *qrMessage = image.QRCodeMessgae;
//    NSLog(@"s = %@", qrMessage);
//    qrMessage = [qrMessage substringWithRange:NSMakeRange(4, 10)];
    NSLog(@"s = %@", qrMessage);
    
    // 日语编码
    NSData *data = [qrMessage dataUsingEncoding:NSShiftJISStringEncoding];
    
    // 是否可以在无信息丢失的情况下进行编码
    if ([qrMessage canBeConvertedToEncoding:NSShiftJISStringEncoding]) {
        NSLog(@"aaaa");
    }
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];//如果中文是utf-8编码转gbk结果为空(还没搞明白)
    NSLog(@"retStr = %@", retStr);
    
//    if (2) {
//        NSInteger max = [qrMessage length];
//
//        char *nbytes = malloc(max + 1);
//        for (int i = 0; i < max; i++)
//        {
//            unichar ch = [qrMessage  characterAtIndex: i];
//            nbytes[i] = (char) ch;
//        }
//        nbytes[max] = '\0';
//        result=[NSString stringWithCString: nbytes
//                                  encoding: enc];
//
//        free(nbytes);
//        NSLog(@"result = %@", result);
//    }
//    int a = 0xff;
//    int b = sprintf("%x", "%d", a);
    
//    char *a = "aaaaa";
//    char *b = "bbbb";
//
//    char *buffer = malloc(strlen(a) + strlen(b));
//    NSLog(@"%lu", strlen(buffer));
//    int result = sprintf(buffer, "%s_aaaaaaa%s", a, b);
//    NSLog(@"result = %d", result);
//    printf("string = %s\n", buffer);
//    NSLog(@"%lu", strlen(buffer));
//    free(buffer);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 必须真机
- (void)pushScanVC:(UIBarButtonItem *)item {
    ZHKQRCodeViewController *qrVC = [[ZHKQRCodeViewController alloc] init];
    [self.navigationController pushViewController:qrVC animated:YES];
}


@end
