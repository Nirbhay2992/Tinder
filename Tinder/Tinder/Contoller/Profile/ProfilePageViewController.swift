//
//  ProfilePageViewController.swift
//  Tinder
//
//  Created by Administrator on 15/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation
import UIKit



class ProfilePageViewController: UIPageViewController  {
    
    struct Item {
        let title:String?
        let subTitle:String?
        let image:UIImage?
        let backgroundColor:UIColor?
    }
    
    fileprivate var items: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        decoratePageControl()
        
        populateItems()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    fileprivate func decoratePageControl() {
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [ProfileViewController.self])
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .gray
    }
    
    fileprivate func populateItems() {
        let text = ["This is first heading", "This is second heading", "This is third heading"]
        
        //for (i)
        
        let backgroundColor:[UIColor] = [.clear, .clear, .clear]
        
        for (index, t) in text.enumerated() {
            let c = createCarouselItemControler(with: t, with: backgroundColor[index])
            items.append(c)
        }
    }
    
    fileprivate func createCarouselItemControler(with titleText: String?, with color: UIColor?) -> UIViewController {
        let c = UIViewController()
        c.view = CarouselItem(titleText: titleText, subTitleText: titleText, background: .clear)
        //c.view = CarouselItem(titleText: titleText, background: color)
        return c
    }
}

extension ProfilePageViewController{
    
    fileprivate func createDataSource(){
    
        //let item_1 = Item.init(title: <#T##String?#>, subTitle: <#T##String?#>, image: <#T##UIImage?#>, backgroundColor: <#T##UIColor?#>)
    }
}

// MARK: - DataSource

extension ProfilePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return items.last
        }
        
        guard items.count > previousIndex else {
            return nil
        }
        
        return items[previousIndex]
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard items.count != nextIndex else {
            return items.first
        }
        
        guard items.count > nextIndex else {
            return nil
        }
        
        return items[nextIndex]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return items.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}

