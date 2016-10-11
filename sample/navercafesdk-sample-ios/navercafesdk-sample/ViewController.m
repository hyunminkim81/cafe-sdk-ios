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
    
    //Only Korea
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
    [[NCSDKManager getSharedInstance] setOrientationIsLandscape:YES];
    
    //Global
    [[NCSDKManager getSharedInstance] setCountry:ENGLISH];
    [[NCSDKManager getSharedInstance] setNeoIdConsumerKey:@"g4G47zfRweZsoeeJXCJB"
                                             globalCafeId:1013311];
    
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
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"My Score" content:@"100 Point?"];
}
- (void)touchButton3 {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"ShortCut" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert addButtonWithTitle:@"Article"];
    [alert addButtonWithTitle:@"Notice"];
    [alert addButtonWithTitle:@"Event"];
    [alert addButtonWithTitle:@"Menu List"];
    [alert addButtonWithTitle:@"Article List"];
    [alert addButtonWithTitle:@"Profile"];
    [alert addButtonWithTitle:[NSString stringWithFormat:@"Toggle Translate Slider"]];
    [alert show];
}

#pragma mark - NCSDKManagerDelegate
- (void)ncSDKViewDidLoad {
    NSLog(@"ncSDKViewDidLoad");
}
- (void)ncSDKViewDidUnLoad {
    NSLog(@"ncSDKViewDidUnLoad");
}
- (void)ncSDKJoinedCafeMember {
    NSLog(@"Complete To Join Cafe");
}
- (void)ncSDKPostedArticleAtMenu:(NSInteger)menuId
                attachImageCount:(NSInteger)imageCount
                attachVideoCount:(NSInteger)videoCount {
    NSLog(@"Complete To Write, Menu ID[%@]", @(menuId));
}
- (void)ncSDKPostedCommentAtArticle:(NSInteger)articleId {
    NSLog(@"Complete Comment, Article ID[%@]", @(articleId));
}
- (void)ncSDKRequestScreenShot {
    
}
- (void)ncSDKDidVoteAtArticle:(NSInteger)articleId {
    NSLog(@"Complete to vote, Article ID[%@]", @(articleId));
}

- (void)ncSDKWidgetPostArticleWithImage {
    NSLog(@"ncSDKWidgetPostArticleWithImage");
}
- (void)ncSDKWidgetSuccessVideoRecord {
    NSLog(@"ncSDKWidgetSuccessVideoRecord");
}

#pragma mark - NCWidgetDelegate
- (void)ncWidgetPostArticle {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"My Score" content:@"100 Point?"];
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
    if ([title isEqualToString:@"Article"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithArticleId:36];
    } else if ([title isEqualToString:@"Notice"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeNotice];
    } else if ([title isEqualToString:@"Event"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeEvent];
    } else if ([title isEqualToString:@"Menu List"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeMenuList];
    } else if ([title isEqualToString:@"Article List"]) {
        [[NCSDKManager getSharedInstance] presentArticleListViewControllerWithMenuId:4];
    } else if ([title isEqualToString:@"Profile"]) {
        [[NCSDKManager getSharedInstance] presentMainViewControllerWithTabIndex:kGLTabTypeProfile];
    } else if ([title hasPrefix:@"Toggle"]) {
        sliderToggle = !sliderToggle;
        [[NCSDKManager getSharedInstance] disableTransparentSlider:sliderToggle];
    }
    
}
@end
