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
    
    init(view: DiceView) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func throwButtonDidPressed() {
        
    }
}
