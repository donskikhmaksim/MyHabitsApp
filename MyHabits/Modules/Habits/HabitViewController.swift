//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Максим Донских on 22.02.2023.
//

import UIKit

class HabitViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Run in the morning, sleep 8 hours etc..."
        textField.textColor = .systemGray2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "COLOR"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

        private lazy var colorPickerButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemPink
            button.layer.cornerRadius = 15
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(colorPickerButtonWasTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private lazy var timeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "TIME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        var strDate = timeFormatter.string(from: timePicker.date)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Every day at \(strDate)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timePicker : UIDatePicker = {
        let picker = UIDatePicker()
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = .wheels
            picker.addTarget(self, action: #selector(timePickersValueWasChanged), for: .valueChanged)
        }
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "New Habit"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonWasTapped))
        let rightButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonWasTapped))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorPickerButton)
        view.addSubview(timeTitleLabel)
        view.addSubview(timeLabel)
        view.addSubview(timePicker)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            colorPickerButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorPickerButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            colorPickerButton.widthAnchor.constraint(equalToConstant: 30),
            colorPickerButton.heightAnchor.constraint(equalTo: colorPickerButton.widthAnchor),
            
            timeTitleLabel.topAnchor.constraint(equalTo: colorPickerButton.bottomAnchor, constant: 15),
            timeTitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: 7),
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func cancelButtonWasTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonWasTapped() {
        let store = HabitsStore.shared
        store.habits.removeAll()
        let newHabit = Habit(name: nameTextField.text ?? "", date: timePicker.date, color: colorPickerButton.backgroundColor ?? UIColor(cgColor: UIColor.white.cgColor))
        if #available(iOS 14.0, *) {
            habitsStoreForEach()
        }
        store.habits.append(newHabit)
        dismiss(animated: true)
    }
    
    @objc private func colorPickerButtonWasTapped() {
        if #available(iOS 14.0, *) {
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            colorPicker.selectedColor = colorPickerButton.backgroundColor ?? UIColor(cgColor: UIColor.white.cgColor)
            present(colorPicker, animated: true)
        }
    }
    
    @objc private func timePickersValueWasChanged() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        
        var strDate = timeFormatter.string(from: timePicker.date)
        timeLabel.text = "Every day at \(strDate)"
    }
}

@available(iOS 14.0, *)
extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        colorPickerButton.backgroundColor = color
    }
    
    func habitsStoreForEach() {
        for habit in HabitsStore.shared.habits {
            print(habit.name)
            print(habit.date)
            print(habit.color)
        }
    }
}
