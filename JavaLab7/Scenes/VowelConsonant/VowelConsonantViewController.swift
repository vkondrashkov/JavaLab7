//
//  VowelConsonantViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol VowelConsonantView: class {
    
}

class VowelConsonantViewController: UIViewController, VowelConsonantView {
    private var vowelConsonantView = UIView()
    private var containerView = UIView()
    private var textField = UITextField()
    private var submitButton = UIButton()
    
    var presenter: VowelConsonantPresenter!
    
    override func loadView() {
        vowelConsonantView = UIView(frame: CGRect.zero)
        vowelConsonantView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        
        textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Enter your character here..."
        textField.font = .boldSystemFont(ofSize: 17)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        //textField.delegate = self
        containerView.addSubview(textField)
        activateTextFieldConstraints(view: textField)
        
        submitButton = UIButton(frame: CGRect.zero)
        submitButton.backgroundColor = .green
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: textField)
        
        vowelConsonantView.addSubview(containerView)
        activateContainerConstraints(view: containerView)
        view = vowelConsonantView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func submitButtonDidPressed(sender: UIButton) {
        presenter.submitButtonDidPressed()
    }
}

private typealias PrivateVowelConsonantViewController = VowelConsonantViewController
private extension PrivateVowelConsonantViewController {
    func activateTextFieldConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.widthAnchor.constraint(equalToConstant: 250),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateSubmitButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateContainerConstraints(view: UIView) {
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
