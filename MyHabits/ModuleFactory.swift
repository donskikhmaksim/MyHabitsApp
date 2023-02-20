//
//  ModuleFactory.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

final class ModuleFactory {
    
    func makeModule(typeOf moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case .habits:
            let viewController = UINavigationController(rootViewController: HabitsViewController())
            return Module(moduleType: moduleType, viewController: viewController)
        case .info:
            let viewController = UINavigationController(rootViewController: InfoViewController())
            return Module(moduleType: moduleType, viewController: viewController)
        }
    }
    
}
