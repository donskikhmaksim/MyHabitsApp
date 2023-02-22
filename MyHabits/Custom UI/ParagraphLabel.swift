//
//  ParagraphLabel.swift
//  MyHabits
//
//  Created by Максим Донских on 21.02.2023.
//

import UIKit

class ParagraphLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: 17)
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
