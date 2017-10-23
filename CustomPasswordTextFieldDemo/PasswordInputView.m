//
//  PasswordInputView.m
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import "PasswordInputView.h"
#import "SFPasswordTextField.h"
#import "SFKeyboardView.h"

@interface PasswordInputView()<LVKeyboardDelegate>
@property (weak, nonatomic) IBOutlet SFPasswordTextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIView *keyboardContentView;

@property (nonatomic, strong) SFKeyboardView *keyboard;

@end

@implementation PasswordInputView

+(PasswordInputView *)inputView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self _initKeyboardView];
    self.confirmButton.enabled = NO;
    self.confirmButton.backgroundColor = [UIColor lightGrayColor];
}

-(void)_initKeyboardView{
    self.keyboard = [[SFKeyboardView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.keyboard.delegate = self;
    [self.keyboardContentView addSubview:self.keyboard];
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.keyboard.frame = CGRectMake(0, 0, self.keyboardContentView.frame.size.width, self.keyboardContentView.frame.size.height);
}


- (IBAction)confirmAction:(id)sender {
    if (self.confirmBlock) {
        self.confirmBlock(self.textField.text);
    }
}
- (IBAction)forgetPasswordAction:(id)sender {
    if (self.forgotPasswordBlock) {
        self.forgotPasswordBlock();
    }
}
- (IBAction)backAction:(id)sender {
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}

-(void)dismiss{
    self.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.35 animations:^{
        self.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - LVKeyboardDelegate/** 点击了数字按钮 */
- (void)keyboard:(LVKeyboardView *)keyboard didClickButton:(UIButton *)button{
    self.textField.word = button.currentTitle;
    if (self.textField.text.length == 6) {
        self.confirmButton.enabled = YES;
        // f57f17
        self.confirmButton.backgroundColor = [UIColor colorWithRed:245/255.0 green:127/255.0 blue:23/255.0 alpha:1];
    }
}
/** 点击删除按钮 */
- (void)keyboard:(LVKeyboardView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn{
    self.textField.word = @"";
    if (self.textField.text.length < 6) {
        self.confirmButton.enabled = NO;
        self.confirmButton.backgroundColor = [UIColor lightGrayColor];
    }
}


@end
