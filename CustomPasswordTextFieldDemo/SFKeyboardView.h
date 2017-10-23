//
//  SFKeyboardView.h
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LVKeyboardView;
@protocol LVKeyboardDelegate <NSObject>

@optional
/** 点击了数字按钮 */
- (void)keyboard:(LVKeyboardView *)keyboard didClickButton:(UIButton *)button;
/** 点击删除按钮 */
- (void)keyboard:(LVKeyboardView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn;

@end

@interface SFKeyboardView : UIView
@property (nonatomic, assign) id<LVKeyboardDelegate> delegate;
@end
