//
//  MainViewController.swift
//  testUIPageViewController
//
//  Created by Pu Yue - PU YUE on 2022/06/30.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var switchButton: UISegmentedControl!
    
    var pageViewControllerObject: PageViewController?
    
    @IBAction func didClick(_ sender: Any) {
        //object 或者 userInfo来传值
        NotificationCenter.default.post(name: Notification.Name("DidClick"), object: switchButton.selectedSegmentIndex)
//        NotificationCenter.default.post(name: Notification.Name("DidClick"), object: switchButton.selectedSegmentIndex, userInfo: ["index": switchButton.selectedSegmentIndex])
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    }
}
