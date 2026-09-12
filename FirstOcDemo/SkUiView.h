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
