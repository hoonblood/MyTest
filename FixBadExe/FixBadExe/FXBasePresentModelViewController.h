//
//  FXBasePresentModelViewController.h
//  FixBadExe
//
//  Created by zhxn on 2017/12/14.
//  Copyright © 2017年 kugou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXBasePresentModelViewController : UIViewController
@property (nonatomic,readonly)UIView *contentView;///<白色的圆角面板UI，可重置其Size，center等属性
@property (nonatomic)BOOL shouldDismissOnTapBackground;//点击背景透明区域是否需要dismiss
/**
 从fromVC present显示

 @param fromVC <#fromVC description#>
 */
- (void)presentFromViewController:(UIViewController *)fromVC;

/**
 从app的根控制器present显示
 */
- (void)presentFromRootViewController;
@end
