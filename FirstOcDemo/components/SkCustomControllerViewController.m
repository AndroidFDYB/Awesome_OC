//
//  SkCustomControllerViewController.m
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

#define UIColorFromHex(hex) \
    [UIColor colorWithRed:(((hex) >> 16) & 0xFF) / 255.0f \
                    green:(((hex) >> 8) & 0xFF) / 255.0f \
                     blue:((hex) & 0xFF) / 255.0f \
                    alpha:(((hex) >> 24) & 0xFF) / 255.0f]


#import "SkCustomControllerViewController.h"

@interface SkCustomControllerViewController ()

@property(nonatomic, strong) UIStackView *stackView;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, assign) NSInteger tagCount;

@end

@implementation SkCustomControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHex(0xf7f8f9);
    self.title = @"StackView Sample";
    
    [self setupAddButton];
     [self setupStackView];
     
     // 初始放两个
     [self addTag:nil];
     [self addTag:nil];

}

- (void)setupAddButton {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [addBtn setTitle:@"+ 添加标签" forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(20, 100, 100, 40);
    [addBtn addTarget:self action:@selector(addTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}


-(void)setupStackView{
    self.stackView = [[UIStackView alloc]init];
    self.stackView.backgroundColor = [UIColor redColor];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.spacing = 12;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.distribution = UIStackViewDistributionFill;
    
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.stackView];
    [self.view addSubview:self.scrollView];
    
    
    
    // Auto Layout position
    UILayoutGuide *guide = self.view.layoutMarginsGuide;
    [NSLayoutConstraint activateConstraints:@[
          [self.scrollView.topAnchor constraintEqualToAnchor:guide.topAnchor constant:60],
          [self.scrollView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
          [self.scrollView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor],
          [self.scrollView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor],
          
          // stackView 宽度跟随 scrollView，高度由内容撑开
          [self.stackView.topAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.topAnchor],
          [self.stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.leadingAnchor],
          [self.stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor],
          [self.stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.bottomAnchor],
          [self.stackView.widthAnchor constraintEqualToAnchor:self.scrollView.frameLayoutGuide.widthAnchor],
      ]];

};


- (void)addTag:(id)sender {
    self.tagCount++;
    UIView *row = [self makeTagRowWithTitle:[NSString stringWithFormat:@"标签 %ld", (long)self.tagCount]];
    [self.stackView addArrangedSubview:row];
    
    NSLog(@"childCount %lu", self.stackView.arrangedSubviews.count);
    
    // 增删动画：StackView 自动处理
    row.alpha = 0;
    row.transform = CGAffineTransformMakeTranslation(0, -20);
    [UIView animateWithDuration:0.3 animations:^{
        row.alpha = 1;
        row.transform = CGAffineTransformIdentity;
        [self.view layoutIfNeeded];
    }];
}

- (UIView *)makeTagRowWithTitle:(NSString *)title {
    UIView *container = [[UIView alloc] init];
    container.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    container.layer.cornerRadius = 8;
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.tag = self.tagCount;  // 简单标识
    [deleteBtn addTarget:self action:@selector(deleteTag:) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    [container addSubview:label];
    [container addSubview:deleteBtn];
    
    [NSLayoutConstraint activateConstraints:@[
        [label.topAnchor constraintEqualToAnchor:container.topAnchor constant:12],
        [label.leadingAnchor constraintEqualToAnchor:container.leadingAnchor constant:16],
        [label.bottomAnchor constraintEqualToAnchor:container.bottomAnchor constant:-12],
        
        [deleteBtn.centerYAnchor constraintEqualToAnchor:label.centerYAnchor],
        [deleteBtn.leadingAnchor constraintEqualToAnchor:label.trailingAnchor constant:8],
        [deleteBtn.trailingAnchor constraintEqualToAnchor:container.trailingAnchor constant:-16],
    ]];
    return container;
}

- (void)deleteTag:(UIButton *)sender {
    UIView *row = sender.superview;
    [UIView animateWithDuration:0.25 animations:^{
        row.alpha = 0;
        row.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [self.stackView removeArrangedSubview:row];  // 先从 stack 移除
        [row removeFromSuperview];                    // 再彻底移除
    }];
}


- (void)printLogFromSw:(NSString *)content {
    NSLog(@"Log from SW : %@",content);
}
@end
