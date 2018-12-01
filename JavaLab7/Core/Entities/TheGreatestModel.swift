//
//  TheGreatestModel.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/23/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol TheGreatestModel {
    func findTheGreatest(firstNumber: Int, secondNumber: Int, thirdNumber: Int) -> Int
}

class TheGreatestModelImplementation: TheGreatestModel {
    func findTheGreatest(firstNumber: Int, secondNumber: Int, thirdNumber: Int) -> Int {
        if firstNumber >= secondNumber && firstNumber >= thirdNumber {
            return firstNumber
        }
        if secondNumber >= firstNumber && secondNumber >= thirdNumber {
            return secondNumber
        }
        return thirdNumber
    }
}
