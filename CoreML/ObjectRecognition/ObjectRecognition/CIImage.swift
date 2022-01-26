//
//  ExtensionUIImage.swift
//  LanguageTutor
//
//  Created by Joshua Newnham on 28/11/2017.
//  Copyright © 2017 Josh Newnham. All rights reserved.
//

import UIKit

extension CIImage{
    
    /**
     Return a resized version of this instance (centered)
     */
    func resize(size: CGSize) -> CIImage {
        // 이미지 전달하면, 상대적 척도 계산 -> 이를 사용해 이미지 척도를 균일하게 조정
        let scale = min(size.width, size.height) / min(self.extent.size.width, self.extent.size.height)
        let resizedImage = self.transformed(
            by: CGAffineTransform(scaleX: scale, y: scale))
        
        // 가로, 세로 초과하는 부분에 대하여 원하는 크기로 잘라내는 작업
        let width = resizedImage.extent.width
        let height = resizedImage.extent.height
        let xOffset = (CGFloat(width) - size.width) / 2.0
        let yOffset = (CGFloat(height) - size.height) / 2.0
        let rect = CGRect(x: xOffset,
                          y: yOffset,
                          width: width,
                          height: height)
        
        return resizedImage
            .clamped(to: rect)
            .cropped(to: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
    
    /**
     Property that returns a Core Video pixel buffer (CVPixelBuffer) of the image.
     CVPixelBuffer is a Core Video pixel buffer (or just image buffer) that holds pixels in main memory. Applications generating frames, compressing or decompressing video, or using Core Image can all make use of Core Video pixel buffers.
     https://developer.apple.com/documentation/corevideo/cvpixelbuffer
     */
    func toPixelBuffer(context:CIContext,
                       size insize:CGSize? = nil,
                       gray:Bool=true) -> CVPixelBuffer?{
        // 이미지를 렌더링할 픽셀 버퍼 만들기
        let attributes = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        
        var nullablePixelBuffer: CVPixelBuffer? = nil
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(self.extent.size.width),
                                         Int(self.extent.size.height),
                                         gray ? kCVPixelFormatType_OneComponent8 : kCVPixelFormatType_32ARGB,
                                         attributes,
                                         &nullablePixelBuffer)
        
        guard status == kCVReturnSuccess, let pixelBuffer = nullablePixelBuffer
            else { return nil }
        
        CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        context.render(self,
                       to: pixelBuffer,
                       bounds: CGRect(x: 0,
                                      y: 0,
                                      width: self.extent.size.width,
                                      height: self.extent.size.height),
                       colorSpace: gray ? CGColorSpaceCreateDeviceGray() : self.colorSpace)
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        return pixelBuffer
    }
}

