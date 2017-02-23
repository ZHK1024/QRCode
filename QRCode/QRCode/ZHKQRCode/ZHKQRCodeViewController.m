//
//  ZHKQRCodeViewController.m
//  QRCode
//
//  Created by ZHK on 2017/2/23.
//  Copyright © 2017年 Weiyu. All rights reserved.
//

#import "ZHKQRCodeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ZHKQRCodeViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession           *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *layer;

@end

@implementation ZHKQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 

- (void)start {
    // 创建捕捉回话
    self.session = [[AVCaptureSession alloc] init];
    
    // 添加输入设备(数据从摄像头输入)
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:device error:nil];
    [_session addInput:input];
    
    // 添加输出数据
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_session addOutput:output];
    
    // 设置输入源数据类型(此处为二维码)
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 添加扫描图层
    self.layer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _layer.frame = self.view.bounds;
    [self.view.layer addSublayer:_layer];
    
    [_session startRunning];
}

#pragma mark - AVCaptureMetadataOutputObjects delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        NSLog(@"%@", object.stringValue);
        
        // 停止扫描
        [self.session stopRunning];

    }else {
        NSLog(@"%@", @"没有扫描到数据");
    }
}


@end
