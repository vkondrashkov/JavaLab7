//
//  DiceViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol DiceView: class {
    
}

final class DiceViewController: UIViewController, DiceView {
    private var diceView = UIView()
    private var containerView = UIView()
    private var scoreView = UIView()
    private var firstDiceLabel = UILabel()
    private var secondDiceLabel = UILabel()
    private var scoreLabel = UILabel()
    private var throwButton = UIButton()
    
    var presenter: DicePresenter!
    
    override func loadView() {
        diceView = UIView(frame: CGRect.zero)
        diceView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        scoreView = UIView(frame: CGRect.zero)
        
        firstDiceLabel.text = "--"
        firstDiceLabel.font = .boldSystemFont(ofSize: 17)
        scoreView.addSubview(firstDiceLabel)
        activateFirstDiceLabelConstraints(view: firstDiceLabel)
        
        secondDiceLabel.text = "--"
        secondDiceLabel.font = .boldSystemFont(ofSize: 17)
        scoreView.addSubview(secondDiceLabel)
        activateSecondDiceLabelConstraints(view: secondDiceLabel)
        
        scoreLabel.text = "Score: --"
        scoreLabel.font = .boldSystemFont(ofSize: 17)
        scoreView.addSubview(scoreLabel)
        activateScoreLabelConstraints(view: scoreLabel)
        
        containerView.addSubview(scoreView)
        activateScoreViewConstraints(view: scoreView)
        
        throwButton = UIButton(frame: CGRect.zero)
        throwButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        throwButton.setTitle("Submit", for: .normal)
        throwButton.addTarget(self, action: #selector(throwButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(throwButton)
        activateThrowButtonConstraints(view: throwButton, anchorView: scoreView)
        
        diceView.addSubview(containerView)
        activateContainerConstraints(view: containerView)
        view = diceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func throwButtonDidPressed() {
        presenter.throwButtonDidPressed()
    }
}

private typealias PrivateDiceViewController = DiceViewController
private extension PrivateDiceViewController {
    func activateFirstDiceLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 100),
            ])
    }
    
    func activateSecondDiceLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -100),
            ])
    }
    
    func activateScoreLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 50),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateScoreViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateThrowButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 100),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
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
