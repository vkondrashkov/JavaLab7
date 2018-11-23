//
//  DragonHeadsModel.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/23/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol DragonHeadsModel {
    func countHeads(age: Int) -> Int
}

class DragonHeadsModelImplementation: DragonHeadsModel {
    private let secondPeriod = 200
    private let thirdPeriod = 300
    
    func countHeads(age: Int) -> Int {
        var heads = 3
        if age < secondPeriod {
            heads += age * 3
        }
        else if age < thirdPeriod {
            heads += secondPeriod * 3 + (age - secondPeriod) * 2
        }
        else {
            heads += secondPeriod * 3 + thirdPeriod * 2 + (age - thirdPeriod)
        }
        return heads
    }
}
