//
//  HomeViewController.swift
//  SlideMenuDemo
//
//  Created by 颜值怪兽 on 2019/7/23.
//  Copyright © 2019 MikeDull. All rights reserved.
//

import UIKit

protocol MenuItemDelegate {
    
    func handleMenuToggle() -> Void
}

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    var delegate: MenuItemDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar() -> Void {
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Slide Menu"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Category Icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}
