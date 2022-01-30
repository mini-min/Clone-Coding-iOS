//
//  ViewController.swift
//  UITableViewDragDrop
//
//  Created by 민 on 2022/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var tableViewList: [String] = ["가", "나", "다", "라", "마"]
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressCalled(gestureRecognizer:)))
        tableView.addGestureRecognizer(longPressGesture)
    }

}

// MARK: - Extension Functions
extension ViewController {
    func snapShotOfCall(_ inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
            
        let cellSnapshot: UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
            
        return cellSnapshot
    }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

// MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        serviceCell.titleLabel.text = tableViewList[indexPath.row]

        return serviceCell
    }
}


extension ViewController {
    @objc func longPressCalled(gestureRecognizer: UIGestureRecognizer) {
        guard let longPress = gestureRecognizer as? UILongPressGestureRecognizer else { return }
        let state = longPress.state
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        
        // 최초 indexPath 변수
        struct Initial {
            static var initialIndexPath: IndexPath?
        }
        
        // 스냅샷
        struct MyCell {
            static var cellSnapshot: UIView?
            static var cellIsAnimating: Bool = false
            static var cellNeedToShow: Bool = false
        }
        
        // UIGestureRecognizer 상태에 따른 case 분기처리
        switch state {
            
        // longPress 제스처가 시작할 때 case
        case UIGestureRecognizer.State.began:
            if indexPath != nil {
                Initial.initialIndexPath = indexPath
                var cell: UITableViewCell? = UITableViewCell()
                cell = tableView.cellForRow(at: indexPath!)
                
                MyCell.cellSnapshot = snapShotOfCall(cell!)
                
                var center = cell?.center
                MyCell.cellSnapshot!.center = center!
                // 원래 처음 꾹 누른 부분의 기존 row는 가려준다.
                MyCell.cellSnapshot!.alpha = 0.0
                tableView.addSubview(MyCell.cellSnapshot!)
                
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    center?.y = locationInView.y
                    MyCell.cellIsAnimating = true
                    MyCell.cellSnapshot!.center = center!
                    MyCell.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    MyCell.cellSnapshot!.alpha = 0.98
                    cell?.alpha = 0.0
                }, completion: { (finished) -> Void in
                    if finished {
                        MyCell.cellIsAnimating = false
                        if MyCell.cellNeedToShow {
                            MyCell.cellNeedToShow = false
                            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                                cell?.alpha = 1
                            })
                        } else {
                            cell?.isHidden = true
                        }
                    }
                })
            }
        // longPress 제스처가 변경될 때 case
        case UIGestureRecognizer.State.changed:
            if MyCell.cellSnapshot != nil {
                var center = MyCell.cellSnapshot!.center
                center.y = locationInView.y
                MyCell.cellSnapshot!.center = center
                
                if ((indexPath != nil) && (indexPath != Initial.initialIndexPath)) && Initial.initialIndexPath != nil {
                    // 메모리 관련 이슈때문에 바꿔준 부분
                    self.tableViewList.insert(self.tableViewList.remove(at: Initial.initialIndexPath!.row), at: indexPath!.row)
                    tableView.moveRow(at: Initial.initialIndexPath!, to: indexPath!)
                    Initial.initialIndexPath = indexPath
                }
            }
        // longPress 제스처가 끝났을 때 case
        default:
            if Initial.initialIndexPath != nil {
                let cell = tableView.cellForRow(at: Initial.initialIndexPath!)
                if MyCell.cellIsAnimating {
                    MyCell.cellNeedToShow = true
                } else {
                    cell?.isHidden = false
                    cell?.alpha = 0.0
                }
                
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    MyCell.cellSnapshot!.center = (cell?.center)!
                    MyCell.cellSnapshot!.transform = CGAffineTransform.identity
                    MyCell.cellSnapshot!.alpha = 0.0
                    cell?.alpha = 1.0
                    
                }, completion: { (finished) -> Void in
                    if finished {
                        Initial.initialIndexPath = nil
                        MyCell.cellSnapshot!.removeFromSuperview()
                        MyCell.cellSnapshot = nil
                    }
                })
            }
        }
    }
}
