//
//  MoodSensorPresenter.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol MoodSensorPresenter {
    func viewDidLoad()
    func generateButtonDidPressed()
}

class MoodSensorPresenterImplementation: MoodSensorPresenter {
    private weak var view: MoodSensorView!
    
    init(view: MoodSensorView) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func generateButtonDidPressed() {
        
    }
}
