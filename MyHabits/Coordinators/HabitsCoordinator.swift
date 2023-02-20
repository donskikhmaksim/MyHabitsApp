//
//  HabitsCoordinator.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

protocol HabitsCoordinatorProtocol {
    
}

final class HabitsCoordinator {
    private(set) var childCoordinators: [Coordinatable] = []
    
    private(set) var module: Module?
    private let factory: ModuleFactory
    
    private var moduleType: Module.ModuleType
    
    init(moduleType: Module.ModuleType, factory: ModuleFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let module = factory.makeModule(typeOf: moduleType)
        let viewController = module.viewController
        viewController.tabBarItem = moduleType.tabBarItem
        self.module = module
        return viewController
    }
}
