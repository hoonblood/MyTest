//
//  FXBasePresentModelViewController.m
//  FixBadExe
//
//  Created by zhxn on 2017/12/14.
//  Copyright © 2017年 kugou. All rights reserved.
//

#import "FXBasePresentModelViewController.h"
#define HexColorWithAlpha(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

@interface FXBasePresentModelViewController ()
@property (nonatomic,strong)UIView *contentView;
@end

@implementation FXBasePresentModelViewController

- (void)loadView
{
    UIControl *control = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = control;
    if (self.shouldDismissOnTapBackground) {
        [control addTarget:self action:@selector(backgroundClicked) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = HexColorWithAlpha(0x666666, .4);
    [self.view addSubview:self.contentView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.contentView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.contentView.layer.cornerRadius = 8.0;
}

#pragma mark - public Method
- (void)presentFromViewController:(UIViewController *)fromVC
{
    if (fromVC) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        [fromVC presentViewController:self animated:YES completion:nil];
    }
}

- (void)presentFromRootViewController
{
    UIViewController *appRootVC = [[UIApplication sharedApplication] delegate].window.rootViewController;
    [self presentFromViewController:appRootVC];
}

#pragma mark - IBAction
-(void)backgroundClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter and setter
- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 400)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

@end
