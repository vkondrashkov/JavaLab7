//
//  VowelConsonantModel.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/23/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol VowelConsonantModel {
    func isVowel(character: String) -> Bool
}

class VowelConsonantModelImplementation: VowelConsonantModel {
    private let vowels = ["a", "e", "i", "o", "u"]
    
    func isVowel(character: String) -> Bool {
        if vowels.contains(character.lowercased()) {
            return true
        }
        return false
    }
}
