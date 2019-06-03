//
//  OnboardingViewController.swift
//  GoHere Onboarding
//
//  Created by Pim Dieks on 14/05/2019.
//  Copyright © 2019 Pim Dieks. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    enum PageViews: String {
        case welcomeScreen
        case loginScreen
        case accountScreen
        case verifyScreen
    }
    
    fileprivate lazy var orderedViewController: [UIViewController] = {
        return [self.getViewController(withIdentifier: PageViews.welcomeScreen.rawValue),
                self.getViewController(withIdentifier: PageViews.loginScreen.rawValue)]
//                self.getViewController(withIdentifier: PageViews.accountScreen.rawValue),
//                self.getViewController(withIdentifier: PageViews.verifyScreen.rawValue)
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        
        vc?.loadViewIfNeeded()
        vc?.view.setNeedsLayout()
        vc?.view.layoutIfNeeded()
        
        if let vc = vc as? ViewController {
            vc.updateTextView()
        }

        return vc!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard orderedViewController.count > nextIndex else { return nil }
        return orderedViewController[nextIndex]
    }
    
    func presentationCount(for: UIPageViewController) -> Int {
        return orderedViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let pageControl = view.subviews.compactMap({$0 as? UIPageControl}).first {
            pageControl.currentPageIndicatorTintColor = UIColor.hex(hex: "#E7523F")
            pageControl.pageIndicatorTintColor = UIColor.hex(hex: "#ffffff")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
    
        if let welcomeScreen = orderedViewController.first {
            setViewControllers([welcomeScreen], direction: .forward, animated: true, completion: nil)
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
