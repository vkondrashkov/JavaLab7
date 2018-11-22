//
//  VowelConsonantPresenter.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol VowelConsonantPresenter {
    func viewDidLoad()
    func submitButtonDidPressed()
}

class VowelConsonantPresenterImplementation: VowelConsonantPresenter {
    private weak var view: VowelConsonantView!
    
    init(view: VowelConsonantView) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func submitButtonDidPressed() {
        print("Button pressed!")
    }
    
}
