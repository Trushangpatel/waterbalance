

#import "VoteView.h"
#import "QCMethod.h"


@interface VoteView ()

@property (nonatomic, strong) CALayer *fill;
@property (nonatomic, strong) CATextLayer *percent;

@end

@implementation VoteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupLayers];
    }
    return self;
}


- (void)setupLayers{
    CALayer * main = [CALayer layer];
    main.anchorPoint     = CGPointMake(0.5, 1);
    main.frame           = CGRectMake(104.92, 25.46, 90.15, 220);
    main.backgroundColor = [UIColor colorWithRed:0.879 green: 0.879 blue:0.878 alpha:1].CGColor;
    [self.layer addSublayer:main];
    {
        CALayer * fill = [CALayer layer];
        fill.anchorPoint     = CGPointMake(0.5, 1);
        fill.frame           = CGRectMake(-11.54, 220, 113.24, 1);
        fill.backgroundColor = [UIColor colorWithRed:0.454 green: 0.721 blue:0.966 alpha:1].CGColor;
        [main addSublayer:fill];
        _fill = fill;
        
        CAShapeLayer * peopleMask = [CAShapeLayer layer];
        peopleMask.frame = CGRectMake(-0.67, 3.67, 91.49, 215.83);
        peopleMask.path  = [self peopleMaskPath].CGPath;
        main.mask = peopleMask;
        
    }
    
    
    CATextLayer * percent = [CATextLayer layer];
    percent.hidden          = YES;
    percent.frame           = CGRectMake(109.7, 255.53, 80.6, 29.7);
    percent.contentsScale   = [[UIScreen mainScreen] scale];
    percent.string          = @"100%";
    percent.font            = (__bridge CFTypeRef)@"STHeitiSC-Medium";
    percent.fontSize        = 24;
    percent.alignmentMode   = kCAAlignmentCenter;
    percent.foregroundColor = [UIColor colorWithRed:0.124 green: 0.799 blue:0.177 alpha:1].CGColor;
    [self.layer addSublayer:percent];
    _percent = percent;
}


- (IBAction)startAllAnimationsWithFraction:(CGFloat)fraction{
    
    [self.fill addAnimation:[self fillAnimationWithFraction:fraction] forKey:@"fillAnimation"];
    
    if (fraction < 0.5) {
        self.percent.foregroundColor = [UIColor colorWithRed:1 green:0.577 blue:0.577 alpha:1].CGColor;
    }else{
        self.percent.foregroundColor = [UIColor colorWithRed:0.124 green: 0.799 blue:0.177 alpha:1].CGColor;
    }
    self.percent.string = [NSString stringWithFormat:@"%d%%", (int)(fraction*100)];
    
    [self.percent addAnimation:[self percentAnimation] forKey:@"percentAnimation"];
}

- (CABasicAnimation*)fillAnimationWithFraction:(CGFloat)fraction{
    CABasicAnimation * boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.toValue            = [NSValue valueWithCGRect:CGRectMake(0, 0, 113, 218*fraction)];
    boundsAnim.duration           = 1;
    boundsAnim.timingFunction     = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    boundsAnim.fillMode = kCAFillModeForwards;
    boundsAnim.removedOnCompletion = NO;
    
    return boundsAnim;
}

- (CAAnimationGroup*)percentAnimation{
    CABasicAnimation * transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.fromValue          = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];;
    transformAnim.toValue            = [NSValue valueWithCATransform3D:CATransform3DIdentity];;
    transformAnim.duration           = 0.5;
    transformAnim.beginTime          = 0.939;
    transformAnim.timingFunction     = [CAMediaTimingFunction functionWithControlPoints:0.42 :0 :0.775 :1.61];
    
    CABasicAnimation * hiddenAnim = [CABasicAnimation animationWithKeyPath:@"hidden"];
    hiddenAnim.fromValue          = @NO;
    hiddenAnim.toValue            = @NO;
    hiddenAnim.duration           = 0.129;
    hiddenAnim.beginTime          = 0.939;
    
    CAAnimationGroup *textAnimGroup   = [CAAnimationGroup animation];
    textAnimGroup.animations          = @[transformAnim, hiddenAnim];
    [textAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
    textAnimGroup.fillMode            = kCAFillModeForwards;
    textAnimGroup.removedOnCompletion = NO;
    textAnimGroup.duration = [QCMethod maxDurationFromAnimations:textAnimGroup.animations];
    
    
    return textAnimGroup;
}

#pragma mark - Bezier Path

- (UIBezierPath*)peopleMaskPath{
    UIBezierPath *peopleMaskPath = [UIBezierPath bezierPath];
    [peopleMaskPath moveToPoint:CGPointMake(45.7432, 0)];
    [peopleMaskPath addCurveToPoint:CGPointMake(9.2959, 36.4473) controlPoint1:CGPointMake(25.6139, 0) controlPoint2:CGPointMake(9.2959, 16.318)];
    [peopleMaskPath addCurveToPoint:CGPointMake(45.7432, 72.8945) controlPoint1:CGPointMake(9.2959, 56.5765) controlPoint2:CGPointMake(25.6139, 72.8945)];
    [peopleMaskPath addCurveToPoint:CGPointMake(82.1905, 36.4473) controlPoint1:CGPointMake(65.8725, 72.8945) controlPoint2:CGPointMake(82.1905, 56.5765)];
    [peopleMaskPath addCurveToPoint:CGPointMake(45.7432, 0) controlPoint1:CGPointMake(82.1905, 16.318) controlPoint2:CGPointMake(65.8725, 0)];
    [peopleMaskPath moveToPoint:CGPointMake(44.9321, 82.4629)];
    [peopleMaskPath addCurveToPoint:CGPointMake(0, 123.9268) controlPoint1:CGPointMake(19.6688, 82.4629) controlPoint2:CGPointMake(0, 87.0981)];
    [peopleMaskPath addCurveToPoint:CGPointMake(44.9321, 215.8312) controlPoint1:CGPointMake(0, 160.7554) controlPoint2:CGPointMake(19.6688, 215.8312)];
    [peopleMaskPath addCurveToPoint:CGPointMake(91.4864, 123.9268) controlPoint1:CGPointMake(70.1954, 215.8312) controlPoint2:CGPointMake(91.4864, 160.7554)];
    [peopleMaskPath addCurveToPoint:CGPointMake(44.9321, 82.4629) controlPoint1:CGPointMake(91.4864, 87.0981) controlPoint2:CGPointMake(70.1954, 82.4629)];
    
    return peopleMaskPath;
}

@end