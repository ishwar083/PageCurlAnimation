//
//  PageViewVC.swift
//  PageCurlAnimation
//
//  Created by mac-00014 on 10/02/20.
//  Copyright © 2020 Mi. All rights reserved.
//

import UIKit

class PageViewVC: UIPageViewController {
    
    private(set) lazy var arrVCs: [UIViewController] = {
        return [self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController(),
                self.newViewController()]
    }()
    
    private func newViewController() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "PageDetailsVC") as! PageDetailsVC
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstVC = arrVCs.first {
            setViewControllers([firstVC],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
}

extension PageViewVC : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrVCs.firstIndex(of:viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
                
        return arrVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrVCs.firstIndex(of:viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        guard nextIndex < arrVCs.count else {
            return nil
        }
        return arrVCs[nextIndex]
    }
    
}
