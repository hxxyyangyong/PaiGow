//
//  HomeMainViewController.h
//  PaiGowGame
//
//  Created by Yong on 15/2/27.
//  Copyright (c) 2015年 tongcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeMainViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView   *selfPaiView;
@property (strong, nonatomic) IBOutlet UIView   *upView;
@property (strong, nonatomic) IBOutlet UIView   *rightView;
@property (strong, nonatomic) IBOutlet UIView   *leftView;

@property (nonatomic, strong) NSArray           *allGonPai;
@property (nonatomic, strong) NSArray           *allDianPai;
@property (nonatomic, strong) NSArray           *allMePai;
@property (nonatomic, strong) NSMutableArray    *allPai;
@property (nonatomic, strong) NSArray           *userpaiArray;
@property (nonatomic, strong) NSArray           *uppaiArray;
@property (nonatomic, strong) NSArray           *leftpaiArray;
@property (nonatomic, strong) NSArray           *rightpaiArray;

@property (nonatomic, strong) NSMutableArray    *paiViewArray;
@property (nonatomic, strong) NSMutableArray    *leftViewArray;
@property (nonatomic, strong) NSMutableArray    *upViewArray;
@property (nonatomic, strong) NSMutableArray    *rightViewArray;

@property (nonatomic, strong) NSMutableArray    *tempA;
- (IBAction)arrangementAction:(id)sender;

@end
