//
//  ViewController.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.
//

import UIKit

class HabitsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushHabitVC))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Today"
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(HabitsViewControllerCustomCell.self, forCellReuseIdentifier: "Custom Cell")
        tableView.layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
    }
    
    @objc private func pushHabitVC() {
        let vc = UINavigationController(rootViewController: HabitViewController())
        present(vc, animated: true)
    }

}

extension HabitsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let cell = UITableViewHeaderFooterView()
            cell.textLabel?.text = "Footer"
            return cell
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
