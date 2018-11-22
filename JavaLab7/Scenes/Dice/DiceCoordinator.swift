//
//  DiceCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class DiceCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: DiceViewController
    
    init() {
        view = DiceViewController()
    }
    
    func start() {
        
    }
}
