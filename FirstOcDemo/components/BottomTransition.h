//
//  BottomTransition.h
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BottomTransition : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype) initWithOperation:(UINavigationControllerOperation) operation;

@end

NS_ASSUME_NONNULL_END
