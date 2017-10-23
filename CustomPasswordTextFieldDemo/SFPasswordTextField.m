//
//  SFPasswordTextField.m
//  CustomPasswordTextFieldDemo
//
//  Created by DBC on 2017/10/23.
//  Copyright © 2017年 DBC. All rights reserved.
//

#import "SFPasswordTextField.h"

#define kMaxInputCount            6

@interface SFPasswordTextField()
@property (nonatomic, strong) NSMutableArray *wordList;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *lineList;
@property (nonatomic, strong) NSMutableArray *pointViewList;

@end

@implementation SFPasswordTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubViews];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self _initSubViews];
}

-(void)_initSubViews{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.layer.masksToBounds = YES;
    contentView.layer.cornerRadius = 5.0;
    contentView.layer.borderColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1].CGColor;
    contentView.layer.borderWidth = 1.0;
    [self addSubview:contentView];
    self.contentView = contentView;
    
    // 划分割线
    NSInteger count = kMaxInputCount - 1; // 线的个数
    for (int i = 0; i < count; i++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
        line.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        [self.contentView addSubview:line];
        [self.lineList addObject:line];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat left = 8;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.contentView.frame = CGRectMake(left, 1, width-left*2, height-1*2);
    
    NSInteger count = self.lineList.count;
    CGFloat contentWidth = width-left*2;
    CGFloat contentHeight = height - 1*2;
    CGFloat itemWidth = contentWidth/(kMaxInputCount*1.0);
    CGFloat offsetX = 0;
    for (int i = 0; i< count; i++) {
        UIView *line = self.lineList[i];
        offsetX = (i+1)*itemWidth;
        line.frame = CGRectMake(offsetX, 0, 0.5, contentHeight);
    }
    
    CGFloat pointWidth = 10;
    offsetX = 0;
    for (int i = 0; i < kMaxInputCount; i++) {
        if (i >= self.pointViewList.count) {
            break;
        }
        offsetX = (itemWidth - pointWidth)/2.0+i*itemWidth;
        UIView *view = self.pointViewList[i];
        view.layer.cornerRadius = pointWidth/2.0;
        view.frame = CGRectMake(offsetX, (contentHeight-pointWidth)/2.0, pointWidth, pointWidth);
    }
}


#pragma mark - getter  setter
-(NSMutableArray *)wordList{
    if (_wordList == nil) {
        _wordList = [NSMutableArray arrayWithCapacity:kMaxInputCount];
    }
    return _wordList;
}

-(NSMutableArray *)lineList{
    if (_lineList == nil) {
        _lineList = [NSMutableArray arrayWithCapacity:kMaxInputCount-1];
    }
    return _lineList;
}

-(NSMutableArray *)pointViewList{
    if (_pointViewList == nil) {
        _pointViewList = [NSMutableArray arrayWithCapacity:kMaxInputCount];
    }
    return _pointViewList;
}

-(NSString *)text{
    if (self.wordList.count == 0) {
        return @"";
    }
    return [self.wordList componentsJoinedByString:@""];
}

-(void)setWord:(NSString *)word{
    if (word.length == 0) {
        if (self.wordList.count>0) {
            [self.wordList removeLastObject];
        }
        [self refreshPoint];
        [self setNeedsLayout];
        return;
    }
    if (word.length > 1) {// 只支持一个个输入
        return;
    }
    if (self.wordList.count >= kMaxInputCount) {
        return;
    }
    [self.wordList addObject:word];
    
    [self refreshPoint];
    
    [self setNeedsLayout];
}

-(void)refreshPoint{
    // 移除旧的点
    for (UIView *view in self.pointViewList) {
        [view removeFromSuperview];
    }
    [self.pointViewList removeAllObjects];
    for (int i = 0; i < self.wordList.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:view];
        [self.pointViewList addObject:view];
        view.layer.masksToBounds = YES;
        view.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    }
    
}

@end
