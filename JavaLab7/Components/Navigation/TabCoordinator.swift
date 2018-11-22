//
//  TabCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class TabCoordinator: Coordinator {
    let window: UIWindow
    let tabController: UITabBarController
    
    var rootViewController: UIViewController {
        return tabController
    }
    
    let vowelConsonantCoordinator: VowelConsonantCoordinator
    let diceCoordinator: DiceCoordinator
    let moodSensorCoordinator: MoodSensorCoordinator
    let theGreatestCoordinator: TheGreatestCoordinator
    let dragonHeadsCoordinator: DragonHeadsCoordinator
    
    var coordinators: [Coordinator] {
        return [vowelConsonantCoordinator, diceCoordinator,
                moodSensorCoordinator, theGreatestCoordinator,
                dragonHeadsCoordinator]
    }
    
    init(window: UIWindow) {
        self.window = window
        tabController = TabViewController()
        vowelConsonantCoordinator = VowelConsonantCoordinator()
        diceCoordinator = DiceCoordinator()
        moodSensorCoordinator = MoodSensorCoordinator()
        theGreatestCoordinator = TheGreatestCoordinator()
        dragonHeadsCoordinator = DragonHeadsCoordinator()
        
    }
    
    func start() {
        var controllers: [UIViewController] = []
        let vowelConsonantViewController = vowelConsonantCoordinator.rootViewController
        vowelConsonantViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0) // Change
        let diceViewController = diceCoordinator.rootViewController
        diceViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1) // Change
        let moodSensorController = moodSensorCoordinator.rootViewController
        moodSensorController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2) // Change
        /*
         let diceViewController = diceCoordinator.rootViewController
         //
         
         let moodSensorViewController = moodSensorCoordinator.rootViewController
         //
         
         let theGreatestViewController = theGreatestCoordinator.rootViewController
         //
         
         let dragonHeadsViewController = dragonHeadsCoordinator.rootViewController
         //
         */
        
        controllers.append(vowelConsonantViewController)
        controllers.append(diceViewController)
        controllers.append(moodSensorController)
        /*
         controllers.append(diceViewController)
         controllers.append(moodSensorViewController)
         controllers.append(theGreatestViewController)
         controllers.append(dragonHeadsViewController)
         */
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        //tabController.delegate = self
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
}
