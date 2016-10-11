# iOS용 Cafe SDK 

> 본 저장소는 Cafe SDK를 사용하기위한 library 및 관련 파일들을 포함하고 있습니다.

Cafe SDK에 대하여 자세히 알고싶으시면 [네이버 CafeSDK 공식카페](http://cafe.naver.com/navercafesdk)를 참조해 주세요.

![Overviw](/guide/images/widget_screenshot.gif)

v.2.0.0
-------------
####updated
1. 영어, 중국어, 일본어, 태국어 채널 지원.

####fixed####
1. iOS 10 관련 이슈 수정.

####issue####
1. 세로모드 2.0.1에서 지원 예정.
2. 언어 설정 중국어인 경우 위젯 동영상 녹화 기능 안되는 이슈.

폴더 구조
-------------

file      | 설명 		
---			| ---		
guide/			| 가이드 문서 및 CafeSDK 설명
lib/		 	| iOS용 CafeSDK 라이브러리 파일
sample/external-lib		| 사용중인 외부 라이브러리
sample/navercafesdk-sample-ios		| xcode sample project
LICENSE     | 라이선스 파일
README.md   | readme 파일


의존 라이브러리
-------------

1. [네이버 아이디 로그인-4.0.7](https://nid.naver.com/devcenter/docs.nhn?menu=IOS)
2. [AFNetworking](https://github.com/AFNetworking/AFNetworking)(UIImageView+AFNetworking)
<br>2.x 모두 사용 가능하며 2.6.3에서 테스트 진행했습니다.
3. [SDWebImage-3.8.2](https://github.com/rs/SDWebImage)
4. [FLAnimatedImage-1.0.12](https://github.com/Flipboard/FLAnimatedImage)


라이선스
-------------
NAVER Cafe SDK for iOS

Copyright 2015 NAVER Corp.
All rights reserved.

Unauthorized use, modification and redistribution of this software are strongly prohibited.
