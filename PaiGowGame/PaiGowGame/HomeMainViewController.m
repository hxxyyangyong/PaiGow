//
//  HomeMainViewController.m
//  PaiGowGame
//
//  Created by Yong on 15/2/27.
//  Copyright (c) 2015年 tongcheng. All rights reserved.
//

#import "HomeMainViewController.h"

@interface HomeMainViewController ()

@end

@implementation HomeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initResource];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (_paiViewArray == nil) {
        _paiViewArray = [NSMutableArray arrayWithCapacity:8];
        CGRect btnFrame = CGRectZero;
        btnFrame.size.width = _selfPaiView.bounds.size.width / 8.0f;
        btnFrame.size.height = btnFrame.size.width*45/34.0f;
        btnFrame.origin.y = (_selfPaiView.frame.size.height - btnFrame.size.height)/2.0f;
        for (int i = 0;i<8;i++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:btnFrame];
            btnFrame.origin.x += btnFrame.size.width;
            button.tag = i+1;
            button.backgroundColor = [UIColor redColor];
            [_selfPaiView addSubview:button];
            [_paiViewArray addObject:button];
        }
        
    }
    
    if (_leftViewArray == nil) {
        _leftViewArray = [NSMutableArray arrayWithCapacity:8];
        CGRect btnFrame = CGRectZero;
        btnFrame.size.width = _leftView.bounds.size.height / 8.0f;
        btnFrame.size.height = btnFrame.size.width*45/34.0f;
        btnFrame.origin.x = 0;
        //(_leftView.frame.size.width - btnFrame.size.height)/2.0f;
        btnFrame.origin.y = -4;
        for (int i = 0;i<8;i++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:btnFrame];
            btnFrame.origin.y += btnFrame.size.width;
            button.tag = i+1;
            button.transform = CGAffineTransformMakeRotation(M_PI_2);
            button.backgroundColor = [UIColor redColor];
            [_leftView addSubview:button];
            [_leftViewArray addObject:button];
        }
    }
    
    if (_upViewArray == nil) {
        _upViewArray = [NSMutableArray arrayWithCapacity:8];
        CGRect btnFrame = CGRectZero;
        btnFrame.size.width = _upView.bounds.size.width / 8.0f;
        btnFrame.size.height = btnFrame.size.width*45/34.0f;
        btnFrame.origin.y = 0;
        //(_upView.frame.size.height - btnFrame.size.height)/2.0f;
        for (int i = 0;i<8;i++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:btnFrame];
            btnFrame.origin.x += btnFrame.size.width;
            button.tag = i+1;
            button.backgroundColor = [UIColor redColor];
            [_upView addSubview:button];
            [_upViewArray addObject:button];
        }
    }
    
    
    
    if (_rightViewArray == nil) {
        _rightViewArray = [NSMutableArray arrayWithCapacity:8];
        CGRect btnFrame = CGRectZero;
        btnFrame.size.width = _rightView.bounds.size.height / 8.0f;
        btnFrame.size.height = btnFrame.size.width*45/34.0f;
        btnFrame.origin.x = (_rightView.frame.size.width - btnFrame.size.height)+4;
        //(_rightView.frame.size.width - btnFrame.size.height)/2.0f;
        btnFrame.origin.y = -4;
        
        for (int i = 0;i<8;i++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:btnFrame];
            btnFrame.origin.y += btnFrame.size.width;
            button.tag = i+1;
            button.backgroundColor = [UIColor redColor];
            button.transform = CGAffineTransformMakeRotation(-M_PI_2);
            [_rightView addSubview:button];
            [_rightViewArray addObject:button];
        }
    }
    [self initData];
}

- (void)initResource
{
    _allGonPai = [NSArray arrayWithObjects:
                  @"img_a_gong_1",@"img_a_gong_1",
                  @"img_a_gong_2",@"img_a_gong_2",
                  @"img_a_gong_3",@"img_a_gong_3",
                  @"img_a_gong_4",@"img_a_gong_4",
                  nil];
    _allDianPai = [NSArray arrayWithObjects:
                   @"img_b_dian_a_9_1",@"img_b_dian_a_9_2",
                   @"img_b_dian_b_8_1",@"img_b_dian_b_8_2",
                   @"img_b_dian_c_7_1",@"img_b_dian_c_7_2",
                   @"img_b_dian_d_6",
                   @"img_b_dian_e_5_1",@"img_b_dian_e_5_2",
                   @"img_b_dian_f_3",
                   nil];
    
    _allMePai = [NSArray arrayWithObjects:
                 @"img_c_me_1",@"img_c_me_1",
                 @"img_c_me_2",@"img_c_me_2",
                 @"img_c_me_3",@"img_c_me_3",
                 @"img_c_me_4",@"img_c_me_4",
                 @"img_c_me_5",@"img_c_me_5",
                 @"img_c_me_6",@"img_c_me_6",
                 @"img_c_me_7",@"img_c_me_7",
                 nil];
    _allPai = [NSMutableArray array];
    [_allPai addObjectsFromArray:_allGonPai];
    [_allPai addObjectsFromArray:_allDianPai];
    [_allPai addObjectsFromArray:_allMePai];
}

- (void)initData
{
    NSMutableArray *chaosArray = [self chaosSortActionWithNormal:_allPai];
    NSInteger i = 0;
    NSMutableArray *user1 = [NSMutableArray array];
    NSMutableArray *user2 = [NSMutableArray array];
    NSMutableArray *user3 = [NSMutableArray array];
    NSMutableArray *user4 = [NSMutableArray array];
    while (chaosArray.count > 0) {
        int index  = arc4random() % chaosArray.count;
        NSString *string =  [chaosArray objectAtIndex:index];
        switch (i%4) {
            case 0:
                [user1 addObject:string];
                break;
            case 1:
                [user2 addObject:string];
                break;
            case 2:
                [user3 addObject:string];
                break;
            case 3:
                [user4 addObject:string];
                break;
                
            default:
                break;
        }
        [chaosArray removeObjectAtIndex:index];
        i++;
    }
    _userpaiArray = user1;
    _leftpaiArray = user2;
    _uppaiArray = user3;
    _rightpaiArray = user4;
    
    for (int i =0 ; i<[_paiViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_paiViewArray objectAtIndex:i];
        NSLog(@"%@",[_userpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_userpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
    for (int i =0 ; i<[_leftViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_leftViewArray objectAtIndex:i];
        NSLog(@"%@",[_leftpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_leftpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    for (int i =0 ; i<[_upViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_upViewArray objectAtIndex:i];
        NSLog(@"%@",[_uppaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_uppaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    for (int i =0 ; i<[_rightViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_rightViewArray objectAtIndex:i];
        NSLog(@"%@",[_rightpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_rightpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
    
    
    
}


- (NSMutableArray *)chaosSortActionWithNormal:(NSMutableArray *)normalarray
{
    NSArray *chaosArray = normalarray;
    chaosArray = [chaosArray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
        return (arc4random() % 3) ;
    }];
    return [NSMutableArray arrayWithArray:chaosArray];
}

- (IBAction)resetAction:(id)sender
{
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)arrangementAction:(id)sender {
    [self arrangement2Action:nil];
    // 返回一个排好序的数组，原来数组的元素顺序不会改变
    // 指定元素的比较方法：compare:
    //   _userpaiArray = [_userpaiArray sortedArrayUsingSelector:@selector(compare:)];
    //    for (int i =0 ; i<[_paiViewArray count]; i++) {
    //        UIButton *paiBtn = (UIButton *)[_paiViewArray objectAtIndex:i];
    //        NSLog(@"%@",[_userpaiArray objectAtIndex:i]);
    //        [paiBtn setImage:[UIImage imageNamed:[_userpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    //    }
    _userpaiArray =
    [self arrangementWith:_userpaiArray];
    _leftpaiArray =
    [self arrangementWith:_leftpaiArray];
    _uppaiArray =
    [self arrangementWith:_uppaiArray];
    _rightpaiArray =
    [self arrangementWith:_rightpaiArray];
    for (int i =0 ; i<[_paiViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_paiViewArray objectAtIndex:i];
        NSLog(@"%@",[_userpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_userpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
    
//    _leftpaiArray = [_leftpaiArray sortedArrayUsingSelector:@selector(compare:)];
    for (int i =0 ; i<[_leftViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_leftViewArray objectAtIndex:i];
        NSLog(@"%@",[_leftpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_leftpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
    
//    _uppaiArray = [_uppaiArray sortedArrayUsingSelector:@selector(compare:)];
    for (int i =0 ; i<[_upViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_upViewArray objectAtIndex:i];
        NSLog(@"%@",[_uppaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_uppaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
//    _rightpaiArray = [_rightpaiArray sortedArrayUsingSelector:@selector(compare:)];
    for (int i =0 ; i<[_rightViewArray count]; i++) {
        UIButton *paiBtn = (UIButton *)[_rightViewArray objectAtIndex:i];
        NSLog(@"%@",[_rightpaiArray objectAtIndex:i]);
        [paiBtn setImage:[UIImage imageNamed:[_rightpaiArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
}

- (void)arrangement2Action:(id)sender
{


}

- (NSMutableArray *)arrangementWith:(NSArray *)array
{
    NSMutableArray *userArray = [NSMutableArray arrayWithArray:array];
    NSMutableArray *gongArray = [NSMutableArray array];
    NSMutableArray *dianArray = [NSMutableArray array];
    NSMutableArray *meArray = [NSMutableArray array];
    for (NSString *paiStr in  userArray) {
        NSRange range1 = [paiStr rangeOfString:@"_a_gong_"];
        if (range1.location != NSNotFound) {//包含gong
            [gongArray addObject:paiStr];
        }else{
            NSRange range2 = [paiStr rangeOfString:@"_b_dian_"];
            if (range2.location != NSNotFound) {//包含dian
                [dianArray addObject:paiStr];
            }else{
                NSRange range2 = [paiStr rangeOfString:@"_c_me_"];
                if (range2.location != NSNotFound) {//包含dian
                    [meArray addObject:paiStr];
                }
            }
        }
    }
    
    gongArray =[NSMutableArray arrayWithArray:[[NSArray arrayWithArray:gongArray] sortedArrayUsingSelector:@selector(compare:)]];
    dianArray = [NSMutableArray arrayWithArray:[[NSArray arrayWithArray:dianArray] sortedArrayUsingSelector:@selector(compare:)]];
    meArray = [NSMutableArray arrayWithArray:[[NSArray arrayWithArray:meArray] sortedArrayUsingSelector:@selector(compare:)]];
    [userArray removeAllObjects];
    
    //124的排序（响）
    if([dianArray containsObject:@"img_b_dian_f_3"]&&[dianArray containsObject:@"img_b_dian_d_6"])
    {
        [userArray addObject:@"img_b_dian_f_3"];
        [userArray addObject:@"img_b_dian_d_6"];
        [dianArray removeObject:@"img_b_dian_f_3"];
        [dianArray removeObject:@"img_b_dian_d_6"];
    }
    
    
    //基础牌的排序
    NSMutableArray *tempgongArray = gongArray;
    int i = 0;
    while (i <[gongArray count]) {
        NSString *paistr =  [gongArray objectAtIndex:i];
        if ([paistr isEqualToString:@"img_a_gong_1"]) {//天
            [userArray addObject:paistr];
            [tempgongArray removeObjectAtIndex:i];
            if ([tempgongArray containsObject:paistr]) {
                [userArray addObject:paistr];
                [tempgongArray removeObject:paistr];
                i += 2;
            }else{
                i +=1;
            }
            if ([dianArray containsObject:@"img_b_dian_a_9_1"]){
                [userArray addObject:@"img_b_dian_a_9_1"];
                [dianArray removeObject:@"img_b_dian_a_9_1"];
            }else if ([dianArray containsObject:@"img_b_dian_a_9_2"]){
                [userArray addObject:@"img_b_dian_a_9_2"];
                [dianArray removeObject:@"img_b_dian_a_9_2"];
            }
        }else if ([paistr isEqualToString:@"img_a_gong_2"]) {//地
            [userArray addObject:paistr];
            [tempgongArray removeObjectAtIndex:i];
            if ([tempgongArray containsObject:paistr]) {
                [userArray addObject:paistr];
                [tempgongArray removeObject:paistr];
                i += 2;
            }else{
                i +=1;
            }
            if ([dianArray containsObject:@"img_b_dian_b_8_1"]){
                [userArray addObject:@"img_b_dian_b_8_1"];
                [dianArray removeObject:@"img_b_dian_b_8_1"];
            }else if ([dianArray containsObject:@"img_b_dian_b_8_2"]){
                [userArray addObject:@"img_b_dian_b_8_2"];
                [dianArray removeObject:@"img_b_dian_b_8_2"];
            }
            
        }else if ([paistr isEqualToString:@"img_a_gong_3"]) {//人
            [userArray addObject:paistr];
            [tempgongArray removeObjectAtIndex:i];
            if ([tempgongArray containsObject:paistr]) {
                [userArray addObject:paistr];
                [tempgongArray removeObject:paistr];
                i += 2;
            }else{
                i +=1;
            }
            if ([dianArray containsObject:@"img_b_dian_c_7_1"]){
                [userArray addObject:@"img_b_dian_c_7_1"];
                [dianArray removeObject:@"img_b_dian_c_7_1"];
            }else if ([dianArray containsObject:@"img_b_dian_c_7_2"]){
                [userArray addObject:@"img_b_dian_c_7_2"];
                [dianArray removeObject:@"img_b_dian_c_7_2"];
            }
        }else if ([paistr isEqualToString:@"img_a_gong_4"]) {//和
            [userArray addObject:paistr];
            [tempgongArray removeObjectAtIndex:i];
            if ([tempgongArray containsObject:paistr]) {
                [userArray addObject:paistr];
                [tempgongArray removeObject:paistr];
                i += 2;
            }else{
                i +=1;
            }
            if ([dianArray containsObject:@"img_b_dian_e_5_1"]){
                [userArray addObject:@"img_b_dian_e_5_1"];
                [dianArray removeObject:@"img_b_dian_e_5_1"];
            }else if ([dianArray containsObject:@"img_b_dian_e_5_2"]){
                [userArray addObject:@"img_b_dian_e_5_2"];
                [dianArray removeObject:@"img_b_dian_e_5_2"];
            }
        }else{
            [userArray addObject:paistr];
            [tempgongArray removeObjectAtIndex:i];
            i +=1;
        }
    }
    if (tempgongArray.count >0) {
        [userArray addObjectsFromArray:tempgongArray];
    }
    if (dianArray.count >0) {
        [userArray addObjectsFromArray:dianArray];
    }
    
    if (meArray.count >0) {
        [userArray addObjectsFromArray:meArray];
    }
    array = userArray;
    return userArray;
}

@end
