//
//  TheGreatestViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol TheGreatestView: class {
    func display(result: String)
}

class TheGreatestViewController: UIViewController, TheGreatestView {
    private var theGreatestView = UIView()
    private var containerView = UIView()
    private var firstNumberLabel = UILabel()
    private var secondNumberLabel = UILabel()
    private var thirdNumberLabel = UILabel()
    var firstNumberField = UITextField()
    var secondNumberField = UITextField()
    var thirdNumberField = UITextField()
    private var resultLabel = UILabel()
    private var submitButton = UIButton()
    
    var presenter: TheGreatestPresenter!
    
    override func loadView() {
        theGreatestView = UIView(frame: CGRect.zero)
        theGreatestView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        
        firstNumberLabel.text = "First number:"
        firstNumberLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(firstNumberLabel)
        activateFirstNumberLabelConstraints(view: firstNumberLabel)
        
        firstNumberField = UITextField(frame: CGRect.zero)
        firstNumberField.placeholder = "Enter first number here..."
        firstNumberField.font = .boldSystemFont(ofSize: 17)
        firstNumberField.borderStyle = .roundedRect
        firstNumberField.autocorrectionType = .no
        firstNumberField.keyboardType = .default
        firstNumberField.clearButtonMode = .whileEditing
        firstNumberField.contentVerticalAlignment = .center
        //textField.delegate = self
        containerView.addSubview(firstNumberField)
        activateFirstNumberFieldConstraints(view: firstNumberField, anchorView: firstNumberLabel)
        
        secondNumberLabel.text = "Second number:"
        secondNumberLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(secondNumberLabel)
        activateSecondNumberLabelConstraints(view: secondNumberLabel, anchorView: firstNumberField)
        
        secondNumberField = UITextField(frame: CGRect.zero)
        secondNumberField.placeholder = "Enter second number here..."
        secondNumberField.font = .boldSystemFont(ofSize: 17)
        secondNumberField.borderStyle = .roundedRect
        secondNumberField.autocorrectionType = .no
        secondNumberField.keyboardType = .default
        secondNumberField.clearButtonMode = .whileEditing
        secondNumberField.contentVerticalAlignment = .center
        //textField.delegate = self
        containerView.addSubview(secondNumberField)
        activateSecondNumberFieldConstraints(view: secondNumberField, anchorView: secondNumberLabel)
        
        thirdNumberLabel.text = "Third number:"
        thirdNumberLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(thirdNumberLabel)
        activateThirdNumberLabelConstraints(view: thirdNumberLabel, anchorView: secondNumberField)
        
        thirdNumberField = UITextField(frame: CGRect.zero)
        thirdNumberField.placeholder = "Enter third number here..."
        thirdNumberField.font = .boldSystemFont(ofSize: 17)
        thirdNumberField.borderStyle = .roundedRect
        thirdNumberField.autocorrectionType = .no
        thirdNumberField.keyboardType = .default
        thirdNumberField.clearButtonMode = .whileEditing
        thirdNumberField.contentVerticalAlignment = .center
        //textField.delegate = self
        containerView.addSubview(thirdNumberField)
        activateThirdNumberFieldConstraints(view: thirdNumberField, anchorView: thirdNumberLabel)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textAlignment = .center
        containerView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: thirdNumberField)
        
        submitButton = UIButton(frame: CGRect.zero)
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Find", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: resultLabel)
        
        theGreatestView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = theGreatestView
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

private typealias PrivateTheGreatestViewController = TheGreatestViewController
private extension PrivateTheGreatestViewController {
    func activateFirstNumberLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateFirstNumberFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSecondNumberLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSecondNumberFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateThirdNumberLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateThirdNumberFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
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
