//
//  DatePickerViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/12/09.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - Properties
    let timeSelector: Selector = #selector(DatePickerViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var pickerTimeLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    // MARK: - @IBAction Properties
    @IBAction func dismissToCommon(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        pickerTimeLabel.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {
//        currentTimeLabel.text = String(count)
//        count += 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        currentTimeLabel.text = "현재시간: " + formatter.string(from: date as Date)
    }
    
}
