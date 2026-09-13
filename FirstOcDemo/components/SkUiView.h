//
//  SkUiView.h
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SkUiView : UIView


@property(nonatomic , copy) NSString* title;
@property(nonatomic , copy) NSString* desc;
@property(nonatomic , copy) NSString* iconRes;
@property(nonatomic, copy, nonnull) void (^clickHandler)(SkUiView* view);

@end

NS_ASSUME_NONNULL_END



// OC 语法问题
// 1. interface中声明的 属性 title ， 在实现类中为什么要使用_作为前缀？私有属性吗？
    // 编译器做了事情了， 为propertis 生成了getter和setter ，其中_title是内存变量
// 2. 同理 setXX方法 - (void)setDesc:(NSString *)desc
//{
//    NSString* iDesc = [desc copy];
//    _desc = iDesc;
//    _descLabel.text = iDesc;
//} 如果直接调用 _desc， 为什么不会死循环
// 3. 方法声明中， 关于lamda ：@property(nonatomic, copy, nonnull) void (^clickHandler)(SkUiView* view);   和 -(void) handleTap: (UITapGestureRecognizer*) gesture  是否算是 两种风格 。  同理方法调用中， 什么时候这么调用： _iconView = [[UIImageView alloc] init];
// [self addSubview:_iconView]; ， 什么时候 这么调用  self.clickHandler(self);
