//
//  ExampleTableViewCell.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/30.
//

import Foundation
import UIKit

class ExampleTableViewCell: UITableViewCell {
    
    let userDefaults = UserDefaults.standard

    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        modeSwitch.isOn = userDefaults.bool(forKey: "darkModeState")
        
//        if modeSwitch.state == .disabled {
//            window!.overrideUserInterfaceStyle = .dark
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func modeChangeSwitchClicked(_ sender: Any) {
        if #available(iOS 13, *) {
            window!.overrideUserInterfaceStyle = modeSwitch.isOn == true ? .dark : .light
            userDefaults.set(modeSwitch.isOn, forKey: "darkModeState")
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ExampleTableViewCell", bundle: nil)
    }
}
