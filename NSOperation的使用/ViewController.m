//
//  ViewController.m
//  NSOperation的使用
//
//  Created by 陈高健 on 15/11/26.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//当点击屏幕的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建url
    NSURL *url=[NSURL URLWithString:@"http://pic7.nipic.com/20100515/2001785_115623014419_2.jpg"];
    //创建Data
    NSData *data=[NSData dataWithContentsOfURL:url];
    //创建operation
    NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downLoadImage:) object:data];
    //执行操作
    [operation start];
}

- (void)downLoadImage:(NSData *)data{
    //将二进制转化为图片
    UIImage *image=[UIImage imageWithData:data];
    //显示图片
    self.imageView.image=image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
