//
//  ContainerViewController.swift
//  SlideMenuDemo
//
//  Created by 颜值怪兽 on 2019/7/23.
//  Copyright © 2019 MikeDull. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Properties
    
    var navController: UIViewController!
    
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        
        configureMenuController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Handlers
    
    func configureHomeController() -> Void {
        
        navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavControllerForHome")
        
        let homeController = navController.children[0] as! HomeViewController
        homeController.delegate = self
        
        let tapGestureRecognize = UITapGestureRecognizer()
        tapGestureRecognize.addTarget(self, action: #selector(handleTapGesture))
        homeController.view.addGestureRecognizer(tapGestureRecognize)
        
        view.addSubview(navController.view)
        addChild(navController)
        navController .didMove(toParent: self)
    }
    
    func configureMenuController() -> Void {
        
        let menuController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuController")
        
        view.insertSubview(menuController.view, at: 0)
        addChild(menuController)
        menuController.didMove(toParent: self)
    }
    
    func showMenuController(shouldExpand: Bool) -> Void {
        
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                
                self.navController.view.transform = CGAffineTransform(translationX: 173.5, y: 0.0)
                self.navController.view.alpha = 0.6
                
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                
                self.navController.view.transform = CGAffineTransform.identity
                self.navController.view.alpha = 1.0
                
            }, completion: nil)
        }
    }
    
    @objc func handleTapGesture() -> Void {
        if isExpanded {
            showMenuController(shouldExpand: false)
            
            isExpanded = false
        }
    }
}


extension ContainerViewController: MenuItemDelegate {
    
    func handleMenuToggle() {
        
        isExpanded = !isExpanded
        
        showMenuController(shouldExpand: isExpanded)
        
    }
    
    
}
