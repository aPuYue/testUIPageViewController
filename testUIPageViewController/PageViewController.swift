//
//  PageViewController.swift
//  testUIPageViewController
//
//  Created by user on 2022/03/14.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var controllers: [UIViewController] = []
    
    var delegate02: SwipeDelegate?
    
//    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        initPageView()
    }
    
    func initPageView(){
        // PageViewControllerで表示するViewControllerをインスタンス化
        let firstVC = storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let secondVC = storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // インスタンス化したViewControllerを配列に追加
        self.controllers = [ firstVC, secondVC ]
        
        // 最初に表示するViewControllerを指定する //默认移动到这里
        setViewControllers([self.controllers[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        
        // PageViewControllerのDataSourceとの関連付け
    }

    @objc func didClick(_ index: Int) {
        switch index {
        case 0:
//            currentPage = 0
            self.setViewControllers([self.controllers[0]], direction: .reverse, animated: true, completion: nil)//注意从2回到1是往前翻页
        default:
//            currentPage = 1
            self.setViewControllers([self.controllers[1]], direction: .forward, animated: true, completion: nil)
        }
    }

}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // 全ページ数を返すメソッド
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.controllers.count
    }
    
    //現在のページを返すメソッド
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return currentPage
//    }

    // 左にスワイプした時の処理 Next 0》 1
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index < self.controllers.count - 1 {
            return self.controllers[index + 1] // 1
        } else {
            return nil // 这里是为了，已经是最后一个还往下一个
        }
    }
    
    // 右にスワイプした時の処理 前一个 1》 0
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index > 0 {
            return self.controllers[index - 1] // 0
        } else {
            return nil // 这里是为了，已经是第一个还往前一个
        }
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {

        guard
            let newViewController = pageViewController.viewControllers?.first,
            let newIndex = self.controllers.firstIndex(of: newViewController)
        else { return }
        DispatchQueue.main.async { [weak self] in
            self?.delegate02?.didSwipe(newIndex)
//            self?.isScrollEnabled = true
            //手指滑动触发UISegmentedControl改变UI部分有一个问题,UI改变的太慢，手指可以来回动，导致index不对
            // self?.isScrollEnabled = true 就是为了这个，
        }
    }
}

//extension UIPageViewController {
//    var scrollView: UIScrollView? {
//        return view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView
//    }
//
//    var isScrollEnabled: Bool {
//        get {
//            return scrollView?.isScrollEnabled ?? true
//        }
//        set {
//            scrollView?.isScrollEnabled = newValue
//        }
//    }
//}
