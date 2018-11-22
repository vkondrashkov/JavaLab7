//
//  MoodSensorCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class MoodSensorCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: MoodSensorViewController
    
    init() {
        view = MoodSensorViewController()
    }
    
    func start() {
        
    }
}