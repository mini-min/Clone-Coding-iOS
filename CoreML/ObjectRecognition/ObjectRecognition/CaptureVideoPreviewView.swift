//
//  CaptureVideoPreviewView.swift
//  LanguageTutor
//
//  Created by Joshua Newnham on 30/11/2017.
//  Copyright © 2017 Josh Newnham. All rights reserved.
//

import AVFoundation
import UIKit

class CapturePreviewView: UIView {

    /// 뷰 생성하는 초기 호출 -> 뷰를 인스턴스화하고 그에 연결할 CALayer를 결정하는 데 사용
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}

