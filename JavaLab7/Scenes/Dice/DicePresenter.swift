//
//  DicePresenter.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol DicePresenter {
    func viewDidLoad()
    func throwButtonDidPressed()
}

class DicePresenterImplementation: DicePresenter {
    private weak var view: DiceView!
    private var model: DiceModel
    
    init(view: DiceView) {
        self.view = view
        self.model = DiceModelImplementation()
    }
    
    func viewDidLoad() {
        
    }
    
    func throwButtonDidPressed() {
        let firstDice = model.throwDice()
        let secondDice = model.throwDice()
        let score = firstDice + secondDice
        view.display(firstDice: String(firstDice))
        view.display(secondDice: String(secondDice))
        view.display(score: String(score))
    }
}
