//
//  ViewController.m
//  AnimationButton
//
//  Created by ma xiao on 1/7/15.
//  Copyright (c) 2015 Zhihu.inc. All rights reserved.
//

#import "ViewController.h"
#import "AnimationButton.h"
@interface ViewController ()

@property (nonatomic, strong) AnimationButton *animateButton;
- (void)onTapButton: (id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  AnimationButton *btn = [[AnimationButton alloc] initWithFrame:CGRectMake(120, 100, 100, 32)];
  [btn setTitle:@"Press Me!" forState:UIControlStateNormal];
  btn.backgroundColor = [UIColor redColor];
  [btn addTarget:self action:@selector(onTapButton:) forControlEvents:UIControlEventTouchUpInside];
  self.animateButton = btn;
  [self.view addSubview:btn];
}

- (void)onTapButton: (id)sender {
  [self.animateButton play];
}

@end
