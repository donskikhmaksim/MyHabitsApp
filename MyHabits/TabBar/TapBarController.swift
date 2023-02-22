//
//  TapBarController.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
