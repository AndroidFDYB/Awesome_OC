//
//  SkUiView.m
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/12.
//

#import "SkUiView.h"

@interface SkUiView()

@property (nonatomic , strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *tileLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end


@implementation SkUiView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

// three views
-(void) setup {
    
    // 卡片外观
     self.backgroundColor = [UIColor whiteColor];
     self.layer.cornerRadius = 12;
     self.layer.shadowColor = [UIColor blackColor].CGColor;
     self.layer.shadowOpacity = 0.1;
     self.layer.shadowOffset = CGSizeMake(0, 4);
     self.layer.shadowRadius = 8;

    
    _tileLabel = [[UILabel alloc] init];
    _tileLabel.font = [UIFont systemFontOfSize:16];
    _tileLabel.textColor = [UIColor blackColor];
    [self addSubview:_tileLabel];
    
    _descLabel = [[UILabel alloc] init];
    _descLabel.font = [UIFont systemFontOfSize:13];
    _descLabel.textColor = [UIColor darkGrayColor];
    _descLabel.numberOfLines = 0;
    [self addSubview:_descLabel];
    
    
    _iconView = [[UIImageView alloc] init];
    [self addSubview:_iconView];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tapGesture];
}


- (void)layoutSubviews {
    CGFloat padding = 12;
    CGFloat iconSize = 40;
    
    _tileLabel.frame = CGRectMake(padding * 2 + iconSize, padding, self.bounds.size.width - padding * 2  - iconSize, iconSize);
    
    CGFloat widthMax = self.bounds.size.width - padding*2;
    // using
    CGRect rect = [_descLabel.text boundingRectWithSize:CGSizeMake(widthMax, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: _descLabel.font} context:nil];
    NSLog(@"lenght : %f",rect.size.height);
    _descLabel.frame =  CGRectMake(padding,iconSize + padding*2 ,widthMax, ceil(rect.size.height));
    _iconView.frame = CGRectMake(padding, padding, iconSize, iconSize);
    
    CGFloat totalHeight = padding * 3 + iconSize + ceil(rect.size.height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width, totalHeight);
}




- (void)setTitle:(NSString *)title
{
    NSString* iTitle = [title copy];
    _title = iTitle;
    _tileLabel.text = iTitle;
    [self setNeedsLayout];
}


- (void)setDesc:(NSString *)desc
{
    NSString* iDesc = [desc copy];
    _desc = iDesc;
    _descLabel.text = iDesc;
}


- (void)setIconRes:(NSString *)iconRes
{	
    NSString* iIconRes = [iconRes copy];
    if(@available(iOS 13.0,*)) {
        self.iconView.image = [[UIImage systemImageNamed:iIconRes] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
}



-(void) handleTap: (UITapGestureRecognizer*) gesture
{
    if(self.clickHandler) {
        self.clickHandler(self);
    }
    
    
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformMakeScale(0.96,0.96);
    }  completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
    }];
    
    
}


@end
	
