//
//  ViewController.swift
//  LanguageTutor
//
//  Created by Joshua Newnham on 16/12/2017.
//  Copyright © 2017 Method. All rights reserved.
//

import UIKit
import CoreVideo
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: CapturePreviewView!
    @IBOutlet weak var classifiedLabel: UILabel!
    
    let videoCapture: VideoCapture = VideoCapture()
    let contex = CIContext()
    let model = Inceptionv3()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.videoCapture.initCamera() {
            (self.previewView.layer as! AVCaptureVideoPreviewLayer).session =
            self.videoCapture.captureSession
            
            (self.previewView.layer as! AVCaptureVideoPreviewLayer).videoGravity = AVLayerVideoGravity.resizeAspectFill
            
            self.videoCapture.asyncStartCapturing()
        } else {
            fatalError("Failed to init VideoCapture")
        }
    }
}

// MARK: - VideoCaptureDelegate

extension ViewController : VideoCaptureDelegate{
    
    func onFrameCaptured(videoCapture: VideoCapture,
                         pixelBuffer: CVPixelBuffer?,
                         timestamp: CMTime) {
        videoCapture.delegate = self
                
        guard let pixelBuffer = pixelBuffer else { return }

        // 모델에 쓰일 이미지 준비 -> 크기 조정
        guard let scaledPixelBuffer = CIImage(cvImageBuffer: pixelBuffer)
            .resize(size: CGSize(width: 299, height: 299))
            .toPixelBuffer(context: contex) else { return }
        
        let prediction = try? self.model.prediction(image: scaledPixelBuffer)
        
        // 레이블 업데이트
        DispatchQueue.main.async {
            self.classifiedLabel.text = prediction?.classLabel ?? "Unknown"
        }
        
    }
}

