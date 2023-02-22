//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Максим Донских on 20.02.2023.

import UIKit

final class InfoViewController: UIViewController {
    
    private enum Constants: String {
        case titleLabelTitle = "Acquire a Habit in 21 days"
        case firstParagraphLabelTitle = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        case secondParagraphLabelTitle = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        case thirdParagraphLabelTitle = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        case fourthParagraphLabelTitle = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        case fifthParagraphLabelTitle = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        case sixthParagraphLabelTitle = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        case seventhParagraphLabelTitle = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся. 6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся. 6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся. 6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся. 6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16
        return view
    }()
    
    private lazy var secondaryStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 12
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelTitle.rawValue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.firstParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var secondParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.secondParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var thirdParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.thirdParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var fourthParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.fourthParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var fifthParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.fifthParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var sixthParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.sixthParagraphLabelTitle.rawValue
        return label
    }()
    
    private lazy var seventhParagraphLabel: ParagraphLabel = {
        let label = ParagraphLabel()
        label.text = Constants.seventhParagraphLabelTitle.rawValue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
     
    }
    
    private func setupUI() {
        navigationItem.title = "Information"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "infoVCNavigationBarBackgroundColor")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        view.backgroundColor = .white
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(secondaryStackView)
        secondaryStackView.addArrangedSubview(firstParagraphLabel)
        secondaryStackView.addArrangedSubview(secondParagraphLabel)
        secondaryStackView.addArrangedSubview(thirdParagraphLabel)
        secondaryStackView.addArrangedSubview(fourthParagraphLabel)
        secondaryStackView.addArrangedSubview(fifthParagraphLabel)
        secondaryStackView.addArrangedSubview(sixthParagraphLabel)
        secondaryStackView.addArrangedSubview(seventhParagraphLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.font.pointSize + 4),
            
            secondaryStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            secondaryStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            secondaryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            secondaryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
