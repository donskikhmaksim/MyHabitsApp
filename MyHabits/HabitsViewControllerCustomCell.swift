//
//  HabitsViewControllerCustomCell.swift
//  MyHabits
//
//  Created by Максим Донских on 22.02.2023.
//

import UIKit

class HabitsViewControllerCustomCell: UITableViewCell {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Cell's Title"
        label.textColor = UIColor(named: "habitsCVCustomCellTitleColor")
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Cell's Description"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Cell's Counter"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkBoxButton: UIButton = {
        // Images
            let checkedImage = UIImage(named: "habits_tab_icon")! as UIImage
            let uncheckedImage = UIImage(named: "habits_tab_icon")! as UIImage
            
//            // Bool property
//            var isChecked: Bool = false {
//                didSet {
//                    if isChecked == true {
//                        self.setImage(checkedImage, for: UIControl.State.normal)
//                    } else {
//                        self.setImage(uncheckedImage, for: UIControl.State.normal)
//                    }
//                }
//            }
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(testFunc), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(counterLabel)
        contentView.addSubview(checkBoxButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            counterLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            counterLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            checkBoxButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBoxButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    @objc private func testFunc() {
        print("test")
    }
}
