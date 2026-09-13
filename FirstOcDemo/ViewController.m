//
//  ViewController.m
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/12.
//

#import "ViewController.h"
#import "SkUiView.h"
#import "SkCustomControllerViewController.h"
#import "components/BottomTransition.h"
#import "FirstOcDemo-Swift.h"


@interface ViewController ()<UINavigationControllerDelegate,DemoViewModelDelegate>

@property (nonatomic, strong) DemoViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    
    // initRootViewCotroller
    ViewController *vc = [[ViewController alloc] init];
    
    
    SkUiView * view = [[SkUiView alloc] initWithFrame:CGRectMake(20, 40, self.view.bounds.size.width - 40, 120)];
    
    view.title = @"Shark";
    view.iconRes = @"star.fill";
    view.desc =  @"这是一个带阴影、图标和点击动画的自定义卡片控件。这是一个带阴影、图标和点击动画的自定义卡片控件。";
    view.clickHandler = ^( SkUiView * view) {
        NSLog(@"Card clicked !!!");
        NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
        view.title = [NSString stringWithFormat:@"Shark : %.0f",interval];
    };
    
    [self.view addSubview:view];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"自定义UI" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, view.bounds.size.height + 40 + 40, 100, 50);
    [button addTarget:self action:@selector(butonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"自定义SwiftUI" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, view.bounds.size.height + 40 + 40 + 100, 100, 50);
    [button addTarget:self action:@selector(butonTappedForSwift) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void) butonTappedForSwift {
    self.viewModel = [[DemoViewModel alloc]init];
    self.viewModel.delegate = self;
//    UIViewController *vc = [SwiftUIBridge makeViewController];
    UIViewController *vc = [SwiftUIBridge makeViewControllerV2WithViewModel:self.viewModel];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) butonTapped {
    NSLog(@"按钮被电击啦啦啦啦");
    
    SkCustomControllerViewController *vc = [[SkCustomControllerViewController alloc]init];
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:vc animated:YES completion:nil];
    
  

    
    // Transition
//    CATransition *transition = [CATransition animation];
//    transition.duration = 0.3;
//    transition.type = kCATransitionMoveIn;
//    transition.subtype = kCATransitionFromTop;
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//    
    [self.navigationController pushViewController:vc animated:YES];
};

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[BottomTransition alloc] initWithOperation:operation];
}

#pragma dmoe
- (void)viewModel:(DemoViewModel *)vm didSubmitText:(NSString *)text {
    NSLog(@"Content From %@",text);
}
@end
