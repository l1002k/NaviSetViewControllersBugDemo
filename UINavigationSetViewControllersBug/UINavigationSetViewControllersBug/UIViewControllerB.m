//
//  UIViewControllerB.m
//  UINavigationSetViewControllersBug
//
//  Created by hzleikun on 16/7/27.
//  Copyright © 2016年 leikun. All rights reserved.
//

#import "UIViewControllerB.h"
#import "UIViewControllerC.h"

@implementation UIViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"B";
    self.view.backgroundColor = [UIColor magentaColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"pushC" style:UIBarButtonItemStylePlain target:self action:@selector(pushCAction)];
}

- (void)pushCAction {
    UIViewControllerC * c = [[UIViewControllerC alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

@end
