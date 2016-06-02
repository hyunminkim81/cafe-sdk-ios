//
//  ViewController.m
//  navercafesdk-sample
//
//  Created by Gyeonghwan on 2015. 10. 26..
//  Copyright (c) 2015년 navercorp. All rights reserved.
//

#import "ViewController.h"
#import <NaverCafeSDK/NCSDKManager.h>
#import <NaverCafeSDK/NCWidget.h>
@interface ViewController () <NCSDKManagerDelegate, NCWidgetDelegate, UIAlertViewDelegate>

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
    [button2 addTarget:self action:@selector(touchButton2) forControlEvents:UIControlEventTouchUpInside];
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
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"제 점수는요" content:@"100점?"];
}
- (void)touchButton3 {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"바로가기" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:nil, nil];
    [alert addButtonWithTitle:@"게시글"];
    [alert addButtonWithTitle:@"공지사항"];
    [alert addButtonWithTitle:@"이벤트"];
    [alert addButtonWithTitle:@"메뉴리스트"];
    [alert addButtonWithTitle:@"게시글리스트"];
    [alert addButtonWithTitle:@"프로필"];
    [alert addButtonWithTitle:[NSString stringWithFormat:@"투명도 슬라이더 토글"]];
    [alert show];
}

#pragma mark - NCSDKManagerDelegate
- (void)ncSDKViewDidLoad {
    NSLog(@"ncSDKViewDidLoad");
}
- (void)ncSDKViewDidUnLoad {
    [[NCWidget getSharedInstance] setNcWidgetDelegate:self];
    [[NCSDKManager getSharedInstance] startWidget];
    NSLog(@"ncSDKViewDidUnLoad");
}
- (void)ncSDKJoinedCafeMember {
    NSLog(@"카페 가입 완료");
}
- (void)ncSDKPostedArticleAtMenu:(NSInteger)menuId {
    NSLog(@"글쓰기 완료, 게시판 아이디[%@]", @(menuId));
}
- (void)ncSDKPostedCommentAtArticle:(NSInteger)articleId {
    NSLog(@"댓글쓰기 완료, 게시글 아이디[%@]", @(articleId));
}

#pragma mark - NCWidgetDelegate
- (void)ncWidgetPostArticle {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"제 점수는요" content:@"100점?"];
}
- (void)ncWidtetExecuteGLink {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentMainViewController];
}
- (void)ncWidgetPostArticleWithImage {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithType:kGLArticlePostTypeImage menuId:10 subject:@"" content:@"" filePath:@""];
}

#pragma mark - UIAlertViewDelegate
static BOOL sliderToggle = NO;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    if ([title isEqualToString:@"게시글"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithArticleId:36];
    } else if ([title isEqualToString:@"공지사항"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeNotice];
    } else if ([title isEqualToString:@"이벤트"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeEvent];
    } else if ([title isEqualToString:@"메뉴리스트"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeMenuList];
    } else if ([title isEqualToString:@"게시글 리스트"]) {
        [[NCSDKManager getSharedInstance] presentArticleListViewControllerWithMenuId:4];
    } else if ([title isEqualToString:@"프로필"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeProfile];
    } else if ([title hasPrefix:@"투명도"]) {
        sliderToggle = !sliderToggle;
        [[NCSDKManager getSharedInstance] disableTransparentSlider:sliderToggle];
    }
    
}
@end
