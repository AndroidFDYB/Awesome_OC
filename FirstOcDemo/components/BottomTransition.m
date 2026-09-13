//
//  BottomTransition.m
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

#import "BottomTransition.h"

@interface BottomTransition()

@property(nonatomic, assign) UINavigationControllerOperation opeation;

@end

@implementation BottomTransition

- (nonnull instancetype)initWithOperation:(UINavigationControllerOperation)operation {
    self = [super init];
    if(self) {
        _opeation = operation;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return  0.3;
}

// sharknode :  animation 也是一个view容器，承载着目标控件到指定位置。
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    BOOL isPush = (self.opeation == UINavigationControllerOperationPush);

    if (isPush) {
        // push：系统计算好的正确位置（导航栏下方）
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        // 初始位置：正确的 frame 整体移到屏幕底部
        toVC.view.frame = CGRectOffset(finalFrame, 0, containerView.bounds.size.height);
        [containerView addSubview:toVC.view];

        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            toVC.view.frame = finalFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        // pop：先把上一页放回去（系统算好的位置）
        toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
        [containerView addSubview:toVC.view];

        // 当前页往下退出
        CGRect startFrame = [transitionContext initialFrameForViewController:fromVC];
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            fromVC.view.frame = CGRectOffset(startFrame, 0, containerView.bounds.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}


@end
