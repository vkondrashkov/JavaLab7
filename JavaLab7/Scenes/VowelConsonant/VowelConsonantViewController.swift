//
//  VowelConsonantViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol VowelConsonantView: class {
    func display(result: String)
}

class VowelConsonantViewController: UIViewController, VowelConsonantView {
    private var vowelConsonantView = UIView()
    private var containerView = UIView()
    private var characterLabel = UILabel()
    var textField = UITextField()
    private var resultLabel = UILabel()
    private var submitButton = UIButton()
    
    var presenter: VowelConsonantPresenter!
    
    override func loadView() {
        vowelConsonantView = UIView(frame: CGRect.zero)
        vowelConsonantView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        
        characterLabel.text = "Character:"
        characterLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(characterLabel)
        activateCharacterLabelConstraints(view: characterLabel)
        
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
        activateTextFieldConstraints(view: textField, anchorView: characterLabel)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textAlignment = .center
        containerView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: textField)
        
        submitButton = UIButton(frame: CGRect.zero)
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Check", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: resultLabel)
        
        vowelConsonantView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        view = vowelConsonantView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @objc func submitButtonDidPressed(sender: UIButton) {
        presenter.submitButtonDidPressed()
    }
    
    func display(result: String) {
        resultLabel.text = result
    }
}

private typealias PrivateVowelConsonantViewController = VowelConsonantViewController
private extension PrivateVowelConsonantViewController {
    func activateCharacterLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    func activateTextFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    func activateResultLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSubmitButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
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
