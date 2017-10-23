//
//  ViewController.m
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import "ViewController.h"
#import "SFPasswordTextField.h"
#import "PasswordInputView.h"

@interface ViewController ()
@property (nonatomic, strong) SFPasswordTextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    __block __weak PasswordInputView *inputView = [PasswordInputView inputView];
    [self.view addSubview:inputView];

    inputView.confirmBlock = ^(NSString *password) {
        NSLog(@"%@", password);
        [inputView dismiss];
    };
    
    inputView.dismissBlock = ^{
        [inputView dismiss];
    };
    inputView.forgotPasswordBlock = ^{
        [inputView dismiss];
    };
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    inputView.frame = CGRectMake(0, height, 375, height);
    [UIView animateWithDuration:0.35 animations:^{
        inputView.frame = CGRectMake(0, 0, 375, height);
    } completion:^(BOOL finished) {
        inputView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
    }];
}

@end
