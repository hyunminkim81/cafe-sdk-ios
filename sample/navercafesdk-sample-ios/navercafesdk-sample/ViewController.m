//
//  ViewController.m
//  navercafesdk-sample
//
//  Created by Gyeonghwan on 2015. 10. 26..
//  Copyright (c) 2015년 navercorp. All rights reserved.
//

#import "ViewController.h"
#import <NaverCafeSDK/NCSDKManager.h>
@interface ViewController () <NCSDKManagerDelegate, UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
    [[NCSDKManager getSharedInstance] setOrientationIsLandscape:YES];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [button1 setImage:[UIImage imageNamed:@"icon1.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(touchButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(button1.frame), 40, 40)];
    [button2 setImage:[UIImage imageNamed:@"icon2.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(presentMenuId) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(button2.frame), 40, 40)];
    [button3 setImage:[UIImage imageNamed:@"icon3.png"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(touchButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchButton1 {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentMainViewController];
}
- (void)touchButton2 {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"제 점수는요" content:@"100점?"];
}
- (void)touchButton3 {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"바로가기" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:nil, nil];
    [alert addButtonWithTitle:@"게시글"];
    [alert addButtonWithTitle:@"공지사항"];
    [alert addButtonWithTitle:@"메뉴리스트"];
    [alert addButtonWithTitle:@"게시글리스트"];
    [alert addButtonWithTitle:[NSString stringWithFormat:@"투명도 슬라이더"]];
    [alert show];
}
//공지사항 탭으로 시작
- (void)presentTab {
    [[NCSDKManager getSharedInstance] setParentViewController:self];

}
//특정 게시물 실행
- (void)presentArticleId {
}
//특정 게시물리스트 실행
- (void)presentMenuId {
    [[NCSDKManager getSharedInstance] setParentViewController:self];

}

#pragma mark - NCSDKManagerDelegate
- (void)ncSDKViewDidLoad {
    NSLog(@"ncSDKViewDidLoad");
}
- (void)ncSDKViewDidUnLoad {
    NSLog(@"ncSDKViewDidUnLoad");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    if ([title isEqualToString:@"게시글"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithArticleId:36];
    } else if ([title isEqualToString:@"공지사항"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:1];
    } else if ([title isEqualToString:@"메뉴리스트"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:3];
    } else if ([title isEqualToString:@"게시글리스트"]) {
        [[NCSDKManager getSharedInstance] presentArticleListViewControllerWithMenuId:4];
    } else if ([title hasPrefix:@"투명도"]) {
        [[NCSDKManager getSharedInstance] disableTransparentSlider:NO];
    }
    
}
@end
