//
//  PasswordInputView.h
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PasswordInputViewConfirmBlock)(NSString *password);

@interface PasswordInputView : UIView
+(PasswordInputView *)inputView;

@property (nonatomic, copy) PasswordInputViewConfirmBlock confirmBlock;
@property (nonatomic, copy) dispatch_block_t forgotPasswordBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

-(void)dismiss;
@end
