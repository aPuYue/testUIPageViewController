//
//  MainViewController.swift
//  testUIPageViewController
//
//  Created by Pu Yue - PU YUE on 2022/06/30.
//

import Foundation
import UIKit

protocol SwipeDelegate {
    func didSwipe(_ index: Int)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var switchButton: UISegmentedControl!
    
    var pageViewControllerObject: PageViewController?
    
    @IBAction func didClick(_ sender: Any) {
        guard let pageViewControllerObject = pageViewControllerObject else { return }
        pageViewControllerObject.didClick(switchButton.selectedSegmentIndex)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // https://stackoverflow.com/questions/29582200/how-do-i-get-the-views-inside-a-container-in-swift
        //使用这个能得到同一个sb中所有 vc实例
        //segue.identifier == "EmbedSegue" 这个ID是segue的不是VC的
        if let vc = segue.destination as? PageViewController {
            self.pageViewControllerObject = vc
            vc.delegate02 = self
        }
    }
}

extension MainViewController: SwipeDelegate {
    // https://www.jianshu.com/p/761068184153
    func didSwipe(_ index: Int) {
        switchButton.selectedSegmentIndex = index
    }
}
