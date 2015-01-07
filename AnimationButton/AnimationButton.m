//
//  AnimationButton.m
//  AnimationButton
//
//  Created by ma xiao on 1/7/15.
//  Copyright (c) 2015 Zhihu.inc. All rights reserved.
//

#import "AnimationButton.h"

@interface AnimationButton()

@property (nonatomic, strong) CALayer *icon;

@end

@implementation AnimationButton

- (void)play {
  [CATransaction begin];
  [CATransaction setValue:[NSNumber numberWithFloat:1.0f]
                   forKey:kCATransactionAnimationDuration];
  [CATransaction setValue:^{

    _icon.opacity = 0;
  } forKey:kCATransactionCompletionBlock];
  
    if (!_icon) {
      _icon = [[CALayer alloc] init];
      _icon.frame = CGRectMake(42, 8, 16, 16);
      _icon.contents = (id)[UIImage imageNamed:@"icon.png"].CGImage;
      [self.layer addSublayer: _icon];
    }
  
  [self.layer removeAllAnimations];
  [_icon removeAllAnimations];
  _icon.opacity = 1.0;

    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D tr1 = CATransform3DMakeScale(0.8, 0.8, 1.0);
    CATransform3D tr2 = CATransform3DMakeScale(2.2, 2.2, 1.0);

    scale.fromValue = [NSValue valueWithCATransform3D:tr1];
    scale.toValue = [NSValue valueWithCATransform3D:tr2];
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue = @1.0;
    opacity.toValue = @0.5;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3.0;
    group.animations = @[scale, opacity];
    
    [_icon addAnimation:group forKey:@"trans1"];
    
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
  CATransform3D tr3 = CATransform3DMakeScale(1.2, 1.2, 1.0);
  CATransform3D tr4 = CATransform3DMakeScale(1.0, 1.0, 1.0);
    widthAnim.values = @[[NSValue valueWithCATransform3D:tr1], [NSValue valueWithCATransform3D:tr3], [NSValue valueWithCATransform3D:tr4]];
    
    CABasicAnimation *opacity2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity2.fromValue = @0.3;
    opacity2.toValue = @1.0;
    
    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    group2.duration = 1.0;
    group2.animations = @[opacity2, widthAnim];
    
    [self.layer addAnimation:group2 forKey:@"trans2"];
  
  [CATransaction commit];
  
}

@end
