# PLUG SDK

![http://static.naver.net/m/cafe/glink/promotion/cafe_sdk_open/img_intro1_20151111.png](http://static.naver.net/m/cafe/glink/promotion/cafe_sdk_open/img_intro1_20151111.png)

PLUG SDK는 모바일 게임에서 이탈하지 않고 커뮤니케이션이 가능한 IN-GAME COMMUNITY 라이브러리 입니다. 간단한 조작으로 프로젝트에 PLUG SDK를 추가 할 수 있습니다.

이미 많은 게임에 적용되어 검증되어 있는 PLUG SDK는 손쉽게 커뮤니케이션 기능을 게임 안에 넣을 수 있습니다.

# How To Get Started
- 제휴신청을 위해 [첨부된 파일](https://github.com/naver/cafe-sdk-android/raw/master/guide/alliance/%EB%84%A4%EC%9D%B4%EB%B2%84%EC%B9%B4%ED%8E%98SDK_%EC%A0%9C%ED%9C%B4%EC%96%91%EC%8B%9D_%EA%B2%8C%EC%9E%84%EC%82%AC%EB%AA%85_%EA%B2%8C%EC%9E%84%EB%AA%85_ver.2.0.0.xlsx)을 작성하여
[PLUG_제휴 dl_naverplugpartner@navercorp.com](dl_naverplugpartner@navercorp.com)로 메일을 보낸다.
- 최신 버전을 [다운로드](https://github.com/naver/cafe-sdk-ios/archive/master.zip)하면 샘플 프로젝트를 실행할 수 있다.
- 프로젝트에 적용하기 위한 [위키 가이드](https://www.gitbook.com/book/plug/plug-sdk-ios/details)가 작성 되어 있다.

# Communication
- [개발 문의 사항](http://cafe.naver.com/ArticleList.nhn?search.clubid=28285034&search.menuid=13&search.boardtype=L)에 있는 질문과 답변이 적용하는데 도움이 될 수 있다.
- 문의 사항이 있는 경우 [카페](http://cafe.naver.com/navercafesdk)를 사용한다.


# Usages
## 1. 요구 사항
- 애플리케이션 사용 환경: iOS 7.0 이상(64비트 아키텍처 지원, bitcode 지원)
- IDE: XCode 6.0 이상

## 2. 프로젝트 설정
네이버 카페 SDK를 사용하려면 XCode에서 다음과 같이 개발 환경을 설정한다.
- Build Settings >  Other Linker Flags에 -ObjC 옵션을 추가한다.


- [다운로드](https://github.com/naver/cafe-sdk-ios/archive/master.zip)한 샘플 프로젝트에 포함되어 있는 SDWebImage, FLAnimatedImage, AFNetworking, 네이버 아이디로 로그인 라이브러리를 프로젝트에 추가한다.

- Build Phases > Link Binary With Libraries에 다음 라이브러리를 추가한다.

 - MobileCoreServices.framework (Required)
 - SystemConfiguration.framework (Required)
 - MediaPlayer.framework (Required)
 - AVFoundation.framework (Required)
 - CoreMedia.framework (Required)
 - AssetsLibrary.framework (Required)
 - Security.framework (Required)
 - ImageIO.framework (Required)
 - QuartzCore.framework (Required)
 - ReplayKit.framework (**Optional**)



## 3. Initialize

### 3-1. 한국 채널(네이버 카페) - 글로벌 채널만 사용하는 경우 세팅하지 않는다.

[네이버 아이디로 로그인 애플리케이션 등록](https://developers.naver.com/apps/#/register?api=nvlogin)에서 받은 ClientId, ClientSecret 값을 세팅한다.

[네이버 카페를 개설](http://section.cafe.naver.com/)하고 얻은 카페 ID를 세팅한다.

[네이버 아이디로 로그인 어플리케이션](https://developers.naver.com/apps/#/myapps) 설정에 등록한 iOS URL Scheme을 세팅한다.

PLUG가 올라갈 부모 뷰 컨트롤러를 세팅한다.

한국 채널만 사용하는 경우 채널코드를 KOREAN으로 세팅한다.
```objective-c
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
                                                     
    [[NCSDKLoginManager getSharedInstance] setNaverLoginURLScheme:@"gLinkSample"];
    
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    
    [[NCSDKManager getSharedInstance] setChannelCode:KOREAN];
```



### 3-2. 글로벌 채널 - 한국 채널만 사용하는 경우 세팅하지 않는다.

개설된 커뮤니티에 매니저 권한으로 접속한 후, [setting > Communities > In-App Community Setting](http://g.cafe.naver.com/plugsample/manage/consumer)으로 진입하여 '커뮤니티 ID 및 Consumer Key, Consumer Secret'를 발급받는다.

![](https://plug.gitbooks.io/plug-sdk-android/content/assets/wiki-plug-setting.png)


ConsumerKey, communityId 값을 세팅한다.

PLUG가 올라갈 부모 뷰 컨트롤러를 세팅한다.

```objective-c
    [[NCSDKManager getSharedInstance] setNeoIdConsumerKey:@"IHCd_HmSiMcXOMC37xZ8"
                                              communityId:1013329];
                                              
    [[NCSDKManager getSharedInstance] setParentViewController:self];
```


## 4. NCSDKManager
[상세 가이드](https://github.com/naver/cafe-sdk-ios/wiki/%5B%ED%95%9C%5D-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%84%A4%EB%AA%85-%EC%83%81%EC%84%B8)에서 자세한 내용을 확인 할 수 있다.

### 4-1. presentMainViewController

PLUG를 실행한다.

```objective-c
[[NCSDKManager getSharedInstance] presentMainViewController];

```

### 4-2. orientationIsLandscape

PLUG 뷰의 가로/세로를 세팅한다.

```objective-c
[[NCSDKManager getSharedInstance] setOrientationIsLandscape:YES];

```

# 폴더 구조


file      | 설명 		
---			| ---		
guide/			| 가이드 문서 및 CafeSDK 설명
lib/		 	| iOS용 CafeSDK 라이브러리 파일
sample/external-lib		| 사용중인 외부 라이브러리
sample/navercafesdk-sample-ios		| xcode sample project
LICENSE     | 라이선스 파일
README.md   | readme 파일


# 의존 라이브러리 - 샘플 프로젝트에 포함되어 있다.

- [네이버 아이디 로그인-4.0.7](https://nid.naver.com/devcenter/docs.nhn?menu=IOS)
- [AFNetworking](https://github.com/AFNetworking/AFNetworking)
<br>2.x, 3.x 사용 가능하며 3.1.0에서 테스트 진행했습니다.
- [SDWebImage-3.8.2](https://github.com/rs/SDWebImage)
- [FLAnimatedImage-1.0.12](https://github.com/Flipboard/FLAnimatedImage)
- ApiGateway-1.5.0


# License
NAVER Cafe SDK for iOS

Copyright 2015 NAVER Corp.
All rights reserved.

Unauthorized use, modification and redistribution of this software are strongly prohibited.
