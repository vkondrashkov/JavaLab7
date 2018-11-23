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
    private var model: VowelConsonantModel
    
    init(view: VowelConsonantView) {
        self.view = view
        self.model = VowelConsonantModelImplementation()
    }
    
    func viewDidLoad() {
        
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? VowelConsonantViewController,
            let text = view.textField.text,
            text.count == 1 else {
                self.view.display(result: "Error!")
                return
        }
        let character = String(text.first!)
        if let character = Int(character) {
            view.display(result: String(character) + " is number")
        }
        else if model.isVowel(character: character) {
            view.display(result: character + " is vowel")
        }
        else {
            view.display(result: character + " is consonant")
        }
    }
    
}
