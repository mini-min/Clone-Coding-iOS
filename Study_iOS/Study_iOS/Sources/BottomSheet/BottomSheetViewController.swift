//
//  BottomSheetViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/08.
//

import UIKit

class BottomSheetViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - @IBOutlet Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - @IBAction Properties
    @IBAction func showBottomSheetButtonClicked(_ sender: Any) {
        let bottomSheetVC = children.first { $0 is BottomSheetVC }
        
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
         self.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        
        if bottomSheetVC == nil {
            showBottomSheetViewController(self)
            // self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }
    
    // MARK: - @Functions
    @objc func dismissAlertController() {
        let bottomSheetVC = BottomSheetVC()
        self.removeFromParent()
    }

    func showBottomSheetViewController(_ onParentViewController: UIViewController) {
        let bottomSheetVC = BottomSheetVC()

        let mainViewFrame = onParentViewController.view.frame
        onParentViewController.addChild(bottomSheetVC)
        onParentViewController.view.addSubview(bottomSheetVC.view)

        let width  = mainViewFrame.width

        let mainHeight: CGFloat = 300
        let mainWidth: CGFloat

        mainWidth = UIDevice.current.userInterfaceIdiom == .pad ? 400 : width

        let yFinalPosition = mainViewFrame.height-mainHeight
        let xFinalPosition = mainViewFrame.midX-mainWidth/2

        let originalXPosition = mainViewFrame.midX - mainWidth/2
        let originalYPosition = mainViewFrame.maxY

        bottomSheetVC.view.frame = CGRect(x: originalXPosition, y: originalYPosition,
        width: mainWidth, height: mainHeight)

        UIView.animate(withDuration: 0.3, animations: {
            bottomSheetVC.view.frame = CGRect(x: xFinalPosition, y: yFinalPosition,
            width: mainWidth, height: mainHeight)
        }, completion: nil)
    }
    
    class BottomSheetVC: UIViewController {
        override func loadView() {
            super.loadView()
            addGestureRecognizer()
            addUIComponent()
        }

        private func addGestureRecognizer() {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(panGesture))
            swipeGesture.direction = .down
            view.addGestureRecognizer(swipeGesture)
        }

        @objc func panGesture(_ recognizer: UISwipeGestureRecognizer) {
            if recognizer.state == .ended {
                switch recognizer.direction {
                case .down:
                    updateSearchView(.down)
                default:
                    break
                }
            }
        }

        private func addUIComponent() {
            let contentView = UIView()
            contentView.backgroundColor = .lightGray
            contentView.cornerRadius = 27
            contentView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(contentView)

            NSLayoutConstraint.activate([
                contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                contentView.topAnchor.constraint(equalTo: view.topAnchor)
            ])

            let dismissIndicatorView = UIView()
            dismissIndicatorView.layer.cornerRadius = 3
            dismissIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            dismissIndicatorView.backgroundColor = .gray
            contentView.addSubview(dismissIndicatorView)

            NSLayoutConstraint.activate([
                dismissIndicatorView.widthAnchor.constraint(equalToConstant: 102),
                dismissIndicatorView.heightAnchor.constraint(equalToConstant: 7),
                dismissIndicatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                dismissIndicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        }

        fileprivate func updateSearchView(_ direction: UISwipeGestureRecognizer.Direction) {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self,
                    let superViewFrame = self.view.superview?.frame else {return}

                var newYPosition: CGFloat = superViewFrame.midY

                switch direction {
                case .down:
                    newYPosition = superViewFrame.maxY
                    self.removeFromParent()

                default:
                    break
                }

                let frame = self.view.frame
                let newXPosition = superViewFrame.midX - frame.width/2
                self.view.frame = CGRect(x: newXPosition, y: newYPosition, width: frame.width, height: frame.height)
            }
        }
    }
}
    
// MARK: - Extensions

