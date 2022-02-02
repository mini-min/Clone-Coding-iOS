# Study_iOS
- [CodeSnippet](#CodeSnippet) - 공통으로 사용할 수 있는 코드 스니펫 코드를 정리해두었습니다.
- [CoreML](#CoreML) - Core ML 프레임워크를 사용한 경험들을 정리해두었습니다.
- [Extensions](#Extensions) - 공통으로 재사용할 수 있는 코드를 익스텐션 함수로 정리해두었습니다.
  + [CALayer+Extension](#CALayer+Extension)
  + [UIAlertController+Extension](#UIAlertController+Extension)
  + [UITextField+Extension](#UITextField+Extension)
  + [UIView+Extension](#UIView+Extension)
  + [UIViewController+Extension](#UIViewController+Extension)
  + [String+Extension](#String+Extension)
- [Features](#Features) - iOS 개발을 할 때, 구현할 수 있는 기능들을 정리해두었습니다.
  + [SocialLogin](#SocialLogin)  
  + [UITableView](#UITableView)  
- [Libraries](#Libraries) - iOS 개발을 할 때, 사용할 수 있는 라이브러리들을 정리해두었습니다.
  + [etc](#etc)
- [UIKit](#UIKit) - iOS 애플리케이션에서 화면을 구성하는 요소들을 자세하게 알아봅니다.
  + [ViewFundamentals](#ViewFundamentals)  
  + [ContainerViews](#ContainerViews)
  + [ContentViews](#ContentViews)
  + [Controls](#Controls)
  + [TextViews](#TextViews)
  + [VisualEffects](#VisualEffects)
  + [Bars](#Bars)

<br>

## CodeSnippet

- SnippetCodeBaseUI - 코드 베이스 기반으로 코드를 짤 때, 공통으로 재사용할 수 있도록 만든 코드 스니펫
- SnippetCommentVC - 코드를 짤 때, MARK 주석 기반으로 구분하여 짤 수 있도록 도와주는 코드 스니펫
- SnippetUITableView - 테이블 뷰를 만들 때, 필수로 작성해야 하는 익스텐션 부분
- SnippetUICollectionView - 컬렉션 뷰를 만들 때, 필수로 작성해야 하는 익스텐션 부분
- SnippetUIPickerView - 피커 뷰를 만들 때, 필수로 작성해야 하는 익스텐션 부분

<br>

## CoreML

- ObjectRecognition - 실세계에서 객체를 인식하는 머신러닝 프로젝트
- FacialEmotionDetection - 사람의 얼굴 표정에 따른 감정을 탐지하는 머신러닝 프로젝트 **[구현 전]**
- ObjectDetection - 실세계에서 객체의 위치를 측정하고, 탐지를 담당하는 머신러닝 프로젝트 **[구현 전]**
- StyleTransfer - 스타일 전이로 예술을 창작하는 머신러닝 프로젝트 **[구현 전]**
- QuickDraw - CNN을 사용해서 드로잉 보조하는 머신러닝 프로젝트 **[구현 전]**
- QuickDrawRNN - RNN을 사용해서 드로잉 보조하는 머신러닝 프로젝트 **[구현 전]**
- ActionShot - 사진 효과 애플리케이션을 구축하는 머신러닝 프로젝트 **[구현 전]**

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

### UITableView

- [UITableViewDragDrop](https://mini-min-dev.tistory.com/61) - 테이블 뷰 cell을 Drag & Drop으로 위치를 바꾸는 방법

<br>

## Libraries

### etc

- [SwiftLint](https://mini-min-dev.tistory.com/47) - 협업 시, 스위프트 스타일의 클린 코드와 코딩 컨벤션을 할 수 있도록 도와주는 라이브러리

<br>

## UIKit

### ViewFundamentals

- [UIView](https://developer.apple.com/documentation/uikit/uiview) - 화면의 직사각형 영역에 대한 콘텐츠를 관리하는 개체입니다.

### ContainerViews

- [UITableView](https://developer.apple.com/documentation/uikit/uitableview) - 
- [UICollectionView](https://developer.apple.com/documentation/uikit/uicollectionview) - 
- [UIStackView](https://developer.apple.com/documentation/uikit/uistackview) - 열이나 행에 뷰 컬렉션을 배치하기 위한 간소화된 인터페이스입니다.
- [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview) - 포함된 보기의 스크롤 및 확대/축소를 허용하는 보기입니다.

### ContentViews

- [UIActivityIndicatorView](https://developer.apple.com/documentation/uikit/uiactivityindicatorview) - 작업이 진행 중임을 나타내는 보기입니다.
- [UIImageView](https://developer.apple.com/documentation/uikit/uiimageview) - 단일 이미지 또는 일련의 애니메이션 이미지를 인터페이스에 표시하는 개체입니다.
- [UIPickerView](https://developer.apple.com/documentation/uikit/uipickerview) - 물레방아 또는 슬롯머신 은유를 사용하여 하나 이상의 값 집합을 표시하는 보기입니다.  
- [UIProgressView](https://developer.apple.com/documentation/uikit/uiprogressview) - 시간 경과에 따른 작업 진행 상황을 나타내는 보기입니다.  

### Controls

- [UIControl](https://developer.apple.com/documentation/uikit/uicontrol) - 사용자 상호 작용에 대한 응답으로 특정 작업이나 의도를 전달하는 시각적 요소인 컨트롤의 기본 클래스입니다.  
- [UIButton](https://developer.apple.com/documentation/uikit/uibutton) - 사용자 상호 작용에 대한 응답으로 사용자 지정 코드를 실행하는 컨트롤입니다.  
- [UIColorWell](https://developer.apple.com/documentation/uikit/uicolorwell) - 색상 선택기를 표시하는 컨트롤입니다.  
- [UIDatePicker](https://developer.apple.com/documentation/uikit/uidatepicker) - 날짜 및 시간 값 입력을 위한 컨트롤입니다.  
- [UIPageControl](https://developer.apple.com/documentation/uikit/uipagecontrol) - 가로로 된 일련의 점을 표시하는 컨트롤로, 각 점은 앱 문서 또는 기타 데이터 모델 엔터티의 페이지에 해당합니다.  
- [UISegmentedControl](https://developer.apple.com/documentation/uikit/uisegmentedcontrol) - 여러 세그먼트로 구성된 수평 컨트롤로, 각 세그먼트는 개별 버튼으로 작동합니다.  
- [UISlider](https://developer.apple.com/documentation/uikit/uislider) - 값의 연속 범위에서 단일 값을 선택하기 위한 컨트롤입니다.  
- [UIStepper](https://developer.apple.com/documentation/uikit/uistepper) - 값을 늘리거나 줄이는 컨트롤입니다.  
- [UISwitch](https://developer.apple.com/documentation/uikit/uiswitch) - 켜기/끄기와 같은 이진 선택을 제공하는 컨트롤입니다.  

### TextViews

- [UILabel](https://developer.apple.com/documentation/uikit/uilabel) - 정보 텍스트의 한 줄 이상을 표시하는 보기입니다.  
- [UITextField](https://developer.apple.com/documentation/uikit/uitextfield) - 인터페이스에서 편집 가능한 텍스트 영역을 표시하는 개체입니다.  
- [UITextView](https://developer.apple.com/documentation/uikit/uitextview) - 스크롤 가능한 여러 줄 텍스트 영역입니다.  

### VisualEffects

- [UIVisualEffect](https://developer.apple.com/documentation/uikit/uivisualeffect) - 시각 효과 보기 및 흐림 및 생동감 효과 개체에 대한 이니셜라이저입니다.  
- [UIVisualEffectView](https://developer.apple.com/documentation/uikit/uivisualeffectview) - 일부 복잡한 시각 효과를 구현하는 개체입니다.  
- [UIVibrancyEffect](https://developer.apple.com/documentation/uikit/uivibrancyeffect) - 시각 효과 보기 뒤에 레이어된 콘텐츠의 색상을 증폭하고 조정하는 개체입니다.  
- [UIBlurEffect](https://developer.apple.com/documentation/uikit/uiblureffect) - 시각 효과 보기 뒤에 레이어된 콘텐츠에 흐림 효과를 적용하는 개체입니다.  

### Bars

- [UINavigationBar](https://developer.apple.com/documentation/uikit/uinavigationbar) - 일반적으로 탐색 컨트롤러와 함께 화면 상단을 따라 막대에 표시되는 탐색 컨트롤입니다.  
- [UISearchBar](https://developer.apple.com/documentation/uikit/uisearchbar) - 사용자로부터 검색 관련 정보를 수신하기 위한 특수 보기입니다.  
- [UIToolBar](https://developer.apple.com/documentation/uikit/uitoolbar) - 인터페이스의 아래쪽 가장자리를 따라 하나 이상의 버튼을 표시하는 컨트롤입니다.  
- [UITablBar](https://developer.apple.com/documentation/uikit/uitabbar) - 앱의 다른 하위 작업, 보기 또는 모드 중에서 선택하기 위해 탭 표시줄에 하나 이상의 버튼을 표시하는 컨트롤입니다.  
