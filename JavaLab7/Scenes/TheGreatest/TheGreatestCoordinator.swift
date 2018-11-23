//
//  TheGreatestCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class TheGreatestCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: TheGreatestViewController
    
    init() {
        view = TheGreatestViewController()
        let presenter = TheGreatestPresenterImplementation(view: view)
        view.presenter = presenter
    }
    
    func start() {
        
    }
}
