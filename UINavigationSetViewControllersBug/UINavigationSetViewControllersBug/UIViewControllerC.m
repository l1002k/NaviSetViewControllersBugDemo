//
//  UIViewControllerC.m
//  UINavigationSetViewControllersBug
//
//  Created by hzleikun on 16/7/27.
//  Copyright © 2016年 leikun. All rights reserved.
//

#import "UIViewControllerC.h"

@implementation UIViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"C";
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"changeNavi" style:UIBarButtonItemStylePlain target:self action:@selector(changeNaviAction)];
}

- (void)changeNaviAction {
    //find another UINavgationController
    UINavigationController *currentNavi = self.navigationController;
    UINavigationController *anotherNavi = nil;
    for(__kindof UIViewController *childViewController in [self.navigationController.parentViewController childViewControllers]) {
        if ([childViewController isKindOfClass:UINavigationController.class]) {
            if (childViewController != currentNavi) {
                anotherNavi = childViewController;
            }
        }
    }
    if (anotherNavi) {
        //modify current navi
        NSMutableArray *currentViewControllers = [NSMutableArray arrayWithArray:currentNavi.viewControllers];
        [currentViewControllers removeObject:self];
        //modify another navi
        NSMutableArray *anotherViewControllers = [NSMutableArray arrayWithArray:anotherNavi.viewControllers];
        [anotherViewControllers addObject:self];
        
        //add this OK
//        [self.view removeFromSuperview];
        
        [currentNavi setViewControllers:currentViewControllers animated:NO];
        [anotherNavi setViewControllers:anotherViewControllers animated:NO];
    }
    
}

@end
