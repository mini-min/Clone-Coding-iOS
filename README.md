# Study_iOS
- [Extensions](#Extensions) - 공통으로 재사용할 수 있는 코드를 익스텐션 함수로 정리해두었습니다.
  + [CALayer+Extension](#CALayer+Extension)
  + [UIAlertController+Extension](#UIAlertController+Extension)
  + [UITextField+Extension](#UITextField+Extension)
  + [UIView+Extension](#UIView+Extension)
  + [UIViewController+Extension](#UIViewController+Extension)
  + [String+Extension](#String+Extension)
- [Features](#Features) - iOS 개발을 할 때, 구현할 수 있는 기능들을 정리해두었습니다.
  + [SocialLogin](#SocialLogin)  

<br>

## Extensions

### CALayer+Extension

- applyShadow - 공통으로 그림자를 쉽게 적용할 수 있는 익스텐션 함수

### UIAlertController+Extension

- setTitle - UIAlertController 타이틀 폰트, 컬러 커스텀하는 익스텐션 함수
- setMessage - UIAlertController 메시지 폰트, 컬러 커스텀하는 익스텐션 함수
- setTint - UIAlertController 틴트 컬러 커스텀하는 익스텐션 함수

### UITextField+Extension

- [setLeftPaddingPoints, setRightPaddingPoints](https://elegant-syrup-933.notion.site/a1ade43858bf4f61863804e5d0064fde) - 텍스트 필드 좌/우 여백을 줄 수 있는 익스텐션 함수

### UIView+Extension

- @IBInspectable cornerRadius - UIView에서 cornerRadius를 인스펙터 영역에서 수정할 수 있도록 만드는 익스텐션
- @IBInspectable borderWidth - UIView에서 borderWidth를 인스펙터 영역에서 수정할 수 있도록 만드는 익스텐션
- @IBInspectable borderColor - UIView에서 borderColor를 인스펙터 영역에서 수정할 수 있도록 만드는 익스텐션
- addSubviews - Add View를 해줄 수 있는 익스텐션 함수
- pinToSafeArea - SafeArea를 기준으로 AutoLayout을 쉽게 잡을 수 있는 익스텐션 함수
- pinToSuperView - SuperView를 기준으로 AutoLayout을 쉽게 잡을 수 있는 익스텐션 함수
- centerInSuperView - SuperView를 기준으로 center AutoLayout을 쉽게 잡을 수 있는 익스텐션 함수
- constraint(width: CGFloat) - width AutoLayout을 쉽게 잡을 수 있는 익스텐션 함수
- constraint(height: CGFloat) - height AutoLayout을 쉽게 잡을 수 있는 익스텐션 함수
- makeWidthEqualHeight - 가로 세로를 같게 만드는 익스텐션 함수
- prepareForAutoLayout - 모든 AutoLayout 함수에 공통으로 들어가야 하는 익스텐션 함수 <필수!>
- [setGradient](https://elegant-syrup-933.notion.site/UIView-setGradient-4795e62883fd4a3882848893b969b407) - 그라디언트를 공통으로 설정할 수 있는 익스텐션 함수

### UIViewController+Extension

- makeCancelDeleteAlert - 취소와 삭제로 이루어진 Alert창을 공통으로 만들 수 있는 익스텐션 함수
- makeOKAlert - 확인 하나로만 이루어진 Alert창을 공통으로 만들 수 있는 익스텐션 함수
- changeRootViewController - UIWindow의 rootViewController를 변경하여 화면전환하는 익스텐션 함수

### String+Extension

- [getChar](https://www.notion.so/String-9f8da3004d11409d957e99c89c8fae8b#d49a3446a0994d56a28b4dff987dd5e9) - Swift에서 String Indexing을 쉽게 다룰 수 있는 익스텐션 함수 

<br>

## Features

### SocialLogin

- [AppleLogin](https://mini-min-dev.tistory.com/94) - 애플 소셜 로그인을 iOS 앱에 구현하는 방법
- [KakaoLogin](https://mini-min-dev.tistory.com/38) - 카카오 소셜 로그인을 iOS 앱에 구현하는 방법

