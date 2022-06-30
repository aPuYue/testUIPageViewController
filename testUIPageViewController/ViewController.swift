//
//  ViewController.swift
//  testUIPageViewController
//
//  Created by Pu Yue - PU YUE on 2022/06/30.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageVC = storyboard!.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        pageVC.view.frame = contentView.bounds
        contentView.addSubview(pageVC.view)
    }

}
