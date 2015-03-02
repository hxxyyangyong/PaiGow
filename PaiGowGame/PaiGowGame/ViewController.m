//
//  ViewController.m
//  PaiGowGame
//
//  Created by Yong on 15/2/26.
//  Copyright (c) 2015年 tongcheng. All rights reserved.
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _allGonPai = [NSArray arrayWithObjects:
                  @"天－1",@"天－2",
                  @"地－1",@"地－2",
                  @"人－1",@"人－2",
                  @"和-1",@"和-2",
                  @"梅十",@"梅十",
                  @"长三",@"长三",
                  @"板凳",@"板凳",
                  nil];
    _allDianPai = [NSArray arrayWithObjects:
                  @"红九",@"黑九",
                  @"弯八",@"平八",
                  @"红七",@"黑七",
                  @"红六",
                  @"红五",@"黑五",
                  @"红三",
                  nil];
    
    _allMePai = [NSArray arrayWithObjects:
                  @"斧头",@"斧头",
                  @"四六－1",@"四六－2",
                  @"么七－1",@"么七－2",
                  @"么六－1",@"么六－2",
                  nil];
    _allPai = [NSMutableArray array];
    [_allPai addObjectsFromArray:_allGonPai];
    [_allPai addObjectsFromArray:_allDianPai];
    [_allPai addObjectsFromArray:_allMePai];
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
    NSLog(@"%@",@"12325");
    NSLog(@"%@",user1);
    NSLog(@"%@",user2);
    NSLog(@"%@",user3);
    NSLog(@"%@",user4);
    
//    for (int i= 0;i<chaosArray.count;i++) {
//        
//        
//    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSMutableArray *)chaosSortActionWithNormal:(NSMutableArray *)normalarray
{
    NSArray *chaosArray = normalarray;
    chaosArray = [chaosArray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
        return (arc4random() % 3) ;
    }];
    return [NSMutableArray arrayWithArray:chaosArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
