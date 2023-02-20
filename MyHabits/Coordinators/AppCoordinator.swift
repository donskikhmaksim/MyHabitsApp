//
//  AppCoordinator.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

class AppCoordinator {
    private(set) var childCoordinators: [Coordinatable] = []
    
    private let factory: ModuleFactory
    
    init(factory: ModuleFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let habitsCoordinator = HabitsCoordinator(moduleType: .habits, factory: factory)
        let infoCoordinator = InfoCoordinator(moduleType: .info, factory: factory)
        
        let tabBarController = TabBarController(viewControllers: [
            habitsCoordinator.start(),
            infoCoordinator.start()
        ])
        
        return tabBarController
    }
    
    func addChildCoordinator(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: {$0 === coordinator} ) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinatable) {
        childCoordinators = childCoordinators.filter( {$0 === coordinator} )
    }
 
}
