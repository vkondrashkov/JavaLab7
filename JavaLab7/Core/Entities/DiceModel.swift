//
//  DiceModel.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/23/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol DiceModel {
    func throwDice() -> Int
}

class DiceModelImplementation: DiceModel {
    func throwDice() -> Int {
        let diceNumber = Int.random(in: 1...6)
        return diceNumber
    }
}
