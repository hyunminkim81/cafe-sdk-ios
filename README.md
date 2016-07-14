# iOS용 Cafe SDK 

> 본 저장소는 Cafe SDK를 사용하기위한 library 및 관련 파일들을 포함하고 있습니다.

Cafe SDK에 대하여 자세히 알고싶으시면 [네이버 CafeSDK 공식카페](http://cafe.naver.com/navercafesdk)를 참조해 주세요.

![Overviw](/guide/images/widget_screenshot.gif)

v.1.7.0
-------------
####updated
1. 위젯을 통하여 동영상 녹확 기능을 제공합니다.
2. 콜백 API 개선 (투표 완료 콜백을 제공합니다)
3. bitcode 지원 (arm64, armv7)

####fixed####
1. CFBundleSupportedPlatforms 이슈 수정

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
<br>1.x ~ 2.x 모두 사용 가능하며 2.6.3에서 테스트 진행했습니다.



라이선스
-------------
NAVER Cafe SDK for iOS

Copyright 2015 NAVER Corp.
All rights reserved.

Unauthorized use, modification and redistribution of this software are strongly prohibited.
