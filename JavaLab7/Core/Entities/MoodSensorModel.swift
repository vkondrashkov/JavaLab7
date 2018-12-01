//
//  MoodSensorModel.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/23/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol MoodSensorModel {
    func generateMood() -> String
}

class MoodSensorModelImplementation: MoodSensorModel {
    private var moods = ["😄", "😌", "😍", "😨", "😈",
                         "👽", "🤕", "😵", "😪", "🤔",
                         "🤪", "😡", "😭", "😤", "💩",
                         "🌚", "🌝", "😼", "😎", "😏"]
    
    func generateMood() -> String {
        let randomIndex = Int.random(in: 0..<moods.count)
        return moods[randomIndex]
    }
}
