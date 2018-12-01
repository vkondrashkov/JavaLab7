//
//  VowelConsonantCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class VowelConsonantCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: VowelConsonantViewController
    
    init() {
        view = VowelConsonantViewController()
        let presenter = VowelConsonantPresenterImplementation(view: view)
        view.presenter = presenter
    }
    
    func start() {
        
    }
}
