//
//  ViewController.m
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/12.
//

#import "ViewController.h"
#import "SkUiView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SkUiView * view = [[SkUiView alloc] initWithFrame:CGRectMake(20, 40, self.view.bounds.size.width - 40, 120)];
    
    view.title = @"Shark";
    view.iconRes = @"star.fill";
    view.desc =  @"这是一个带阴影、图标和点击动画的自定义卡片控件。";
    view.clickHandler = ^( SkUiView * view) {
        NSLog(@"Card clicked !!!");
        NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
        view.title = [NSString stringWithFormat:@"Shark : %.0f",interval];
    };
    
    [self.view addSubview:view];
}


@end
