//
//  VideoCapture.swift
//  LanguageTutor
//
//  Created by Joshua Newnham on 29/11/2017.
//  Copyright © 2017 Josh Newnham. All rights reserved.
//

import UIKit
import AVFoundation

public protocol VideoCaptureDelegate: class {
    func onFrameCaptured(
        videoCapture: VideoCapture,
        pixelBuffer: CVPixelBuffer?,
        timestamp: CMTime)
}

/// 카메라를 설정하고 프레임을 캡처하는 작업을 처리하기 위한 VideoCapture Class

public class VideoCapture: NSObject {
    
    public weak var delegate: VideoCaptureDelegate?
    
    let captureSession = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: "session queue")
    
    /**
     Frames Per Second; used to throttle capture rate
     */
    public var fps = 15    
    
    var lastTimestamp = CMTime()
    
    override init() {
        super.init()
        
    }
    
    func initCamera() -> Bool {
        // captureSession에 여러 구성 작업을 일괄 처리하겠다는 신호 + 품질 수준 결정
        captureSession.beginConfiguration()
        captureSession.sessionPreset = AVCaptureSession.Preset.medium
        
        // 실제 장치를 얻음 ->  동영상을 기록할 수 있는 기본 장치 + 실제 카메라에서 데이터를 캡처하는 AVCaptureDeviceInput 인스턴스에 감쌈
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("ERROR: no video devices available")
            return false
        }
        
        guard let videoInput = try? AVCaptureDeviceInput(device: captureDevice) else {
            print("ERROR: could not create AVCaptureDeviceInput")
            return false
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }
        
        /// 프레임의 도착지 추가
        let videoOutput = AVCaptureVideoDataOutput()
        
        let settings: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: NSNumber(value: kCVPixelFormatType_32BGRA)
        ]
        videoOutput.videoSettings = settings
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
        
        videoOutput.connection(with: AVMediaType.video)?.videoOrientation = .portrait
        
        captureSession.commitConfiguration()
        
        return true
    }
    
    /**
     Start capturing frames
     This is a blocking call which can take some time, therefore you should perform session setup off
     the main queue to avoid blocking it.
     */
    public func asyncStartCapturing(completion: (() -> Void)? = nil) {
        sessionQueue.async {
            if !self.captureSession.isRunning {
                self.captureSession.startRunning()
            }
            
            if let completion = completion {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    /**
     Stop capturing frames
     */
    public func asyncStopCapturing(completion: (() -> Void)? = nil) {
        sessionQueue.async {
            if self.captureSession.isRunning {
                self.captureSession.stopRunning()
            }
            
            if let completion = completion {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
        
    }
    
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension VideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    /**
     Called when a new video frame was written
     */
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let delegate = delegate else {
            return
        }
        
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer)
        
        let elapsedTime = timestamp - lastTimestamp
        if elapsedTime >= CMTimeMake(value: 1, timescale: Int32(fps)) {
            
            lastTimestamp = timestamp
            let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
            
            delegate.onFrameCaptured(videoCapture: self, pixelBuffer: imageBuffer, timestamp: timestamp)
        }
    }
        
}
