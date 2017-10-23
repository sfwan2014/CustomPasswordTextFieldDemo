//
//  SFPasswordTextField.h
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFPasswordTextField : UIView
@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong) NSString *word;// 只支持一个个输入
@end
