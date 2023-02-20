//
//  Module.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

struct Module {
    
    private enum Constants: String {
        case habitsTitle = "Habits"
        case infoTitle = "Info"
    }
    
    enum ModuleType {
        case habits
        case info
    }
    
    let moduleType: ModuleType
    let viewController: UIViewController
}

extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .habits:
            return UITabBarItem(title: Module.Constants.habitsTitle.rawValue, image: .add, tag: 0)
        case .info:
            return UITabBarItem(title: Module.Constants.infoTitle.rawValue, image: .checkmark, tag: 1)
        }
    }
}
