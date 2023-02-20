//
//  ViewController.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(testFunc))
    }
    
    @objc private func testFunc() {
        print("test")
    }

}

