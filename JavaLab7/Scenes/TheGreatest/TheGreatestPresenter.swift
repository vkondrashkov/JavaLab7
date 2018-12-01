//
//  TheGreatestPresenter.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol TheGreatestPresenter {
    func viewDidLoad()
    func submitButtonDidPressed()
}

class TheGreatestPresenterImplementation: TheGreatestPresenter {
    private weak var view: TheGreatestView!
    private var model: TheGreatestModel
    
    init(view: TheGreatestView) {
        self.view = view
        model = TheGreatestModelImplementation()
    }
    
    func viewDidLoad() {
        
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? TheGreatestViewController,
            let firstNumber = Int(view.firstNumberField.text ?? "nil"),
            let secondNumber = Int(view.secondNumberField.text ?? "nil"),
            let thirdNumber = Int(view.thirdNumberField.text ?? "nil") else {
                self.view.display(result: "Error!")
                return
        }
        let number = model.findTheGreatest(firstNumber: firstNumber, secondNumber: secondNumber, thirdNumber: thirdNumber)
        view.display(result: "Greatest: " + String(number))
    }
}
