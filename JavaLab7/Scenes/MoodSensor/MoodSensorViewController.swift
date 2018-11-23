//
//  MoodSensorViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol MoodSensorView: class {
    func display(mood: String)
}

class MoodSensorViewController: UIViewController, MoodSensorView {
    private var moodSensorView = UIView()
    private var containerView = UIView()
    private var moodLabel = UILabel()
    private var generateButton = UIButton()
    
    var presenter: MoodSensorPresenter!
    
    override func loadView() {
        moodSensorView = UIView(frame: CGRect.zero)
        moodSensorView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        
        moodLabel.text = " "
        moodLabel.font = .boldSystemFont(ofSize: 50)
        moodLabel.textAlignment = .center
        containerView.addSubview(moodLabel)
        activateMoodLabelConstraints(view: moodLabel)
        
        generateButton = UIButton(frame: CGRect.zero)
        generateButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        generateButton.setTitle("Press me!", for: .normal)
        generateButton.layer.cornerRadius = 5
        generateButton.addTarget(self, action: #selector(generateButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(generateButton)
        activateGenerateButtonConstraints(view: generateButton, anchorView: moodLabel)
        
        moodSensorView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = moodSensorView
    }
    
    @objc func generateButtonDidPressed(sender: UIButton) {
        presenter.generateButtonDidPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func display(mood: String) {
        moodLabel.text = mood
    }
}

private typealias PrivateMoodSensorViewController = MoodSensorViewController
private extension PrivateMoodSensorViewController {
    func activateMoodLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateGenerateButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 50),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    func activateContainerViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
