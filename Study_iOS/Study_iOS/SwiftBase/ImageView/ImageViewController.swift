//
//  ImageViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/12/08.
//

import UIKit

class ImageViewController: UIViewController {

    // MARK: - Properties
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var resizeButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on")
        imgOff = UIImage(named: "lamp_off")
        
        imgView.image = imgOn
    }
    
    // MARK: - @IBAction Properties
    @IBAction func dismissToCommon(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resizeButtonClicked(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            resizeButton.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            resizeButton.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func imageChangeSwitchClciked(_ sender: UISwitch) {
        
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
}

// MARK: - Extensions
