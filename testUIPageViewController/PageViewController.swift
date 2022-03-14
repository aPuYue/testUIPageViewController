//
//  PageViewController.swift
//  testUIPageViewController
//
//  Created by user on 2022/03/14.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var controllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initPageView()
    }
    
    func initPageView(){
        // PageViewControllerで表示するViewControllerをインスタンス化
        let firstVC = storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let secondVC = storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // インスタンス化したViewControllerを配列に追加
        self.controllers = [ firstVC, secondVC ]
        
        // 最初に表示するViewControllerを指定する
        setViewControllers([self.controllers[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        
        // PageViewControllerのDataSourceとの関連付け
        self.dataSource = self
    }


}

extension PageViewController: UIPageViewControllerDataSource {
    // スクロールするページ数
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.controllers.count
    }

    // 左にスワイプした時の処理
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index < self.controllers.count - 1 {
            return self.controllers[index + 1]
        } else {
            return nil
        }
    }
    
    // 右にスワイプした時の処理
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index > 0 {
            return self.controllers[index - 1]
        } else {
            return nil
        }
    }
}

