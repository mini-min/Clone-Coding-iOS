import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
        
    override func loadView() {

        // 기본 세팅
        let view = UIView()
        view.backgroundColor = .white
        
        // Creating a View
        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
        let redView = UIView(frame: rect)
        
        
        redView.backgroundColor = .red
        view.addSubview(redView)


        self.view = view
    }

}

PlaygroundPage.current.liveView = ViewController()
