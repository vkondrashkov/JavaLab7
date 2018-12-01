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
        let vowelInactiveTabBarImage = UIImage(named: "vowels-inactive")
        let vowelActiveTabBarImage = UIImage(named: "vowels")
        let vowelConsonantTabBarItem = UITabBarItem(title: "Vowels", image: vowelInactiveTabBarImage, selectedImage: vowelActiveTabBarImage)
        vowelConsonantViewController.tabBarItem = vowelConsonantTabBarItem
        
        let diceViewController = diceCoordinator.rootViewController
        let diceInactiveTabBarImage = UIImage(named: "dice-inactive")
        let diceActiveTabBarImage = UIImage(named: "dice")
        let diceTabBarItem = UITabBarItem(title: "Dice", image: diceInactiveTabBarImage, selectedImage: diceActiveTabBarImage)
        diceViewController.tabBarItem = diceTabBarItem
        
        let moodSensorController = moodSensorCoordinator.rootViewController
        let moodSensorInactiveTabBarImage = UIImage(named: "mood-inactive")
        let moodSensorActiveTabBarImage = UIImage(named: "mood")
        let moodSensorTabBarItem = UITabBarItem(title: "Mood", image: moodSensorInactiveTabBarImage, selectedImage: moodSensorActiveTabBarImage)
        moodSensorController.tabBarItem = moodSensorTabBarItem
        
        let theGreatestViewController = theGreatestCoordinator.rootViewController
        let theGreatestInactiveTabBarImage = UIImage(named: "greatest-inactive")
        let theGreatestActiveTabBarImage = UIImage(named: "greatest")
        let theGreatestTabBarItem = UITabBarItem(title: "Greatest", image: theGreatestInactiveTabBarImage, selectedImage: theGreatestActiveTabBarImage)
        theGreatestViewController.tabBarItem = theGreatestTabBarItem
        
        let dragonHeadsController = dragonHeadsCoordinator.rootViewController
        let dragonHeadsInactiveTabBarImage = UIImage(named: "dragon-inactive")
        let dragonHeadsActiveTabBarImage = UIImage(named: "dragon")
        let dragonHeadsTabBarItem = UITabBarItem(title: "Dragon", image: dragonHeadsInactiveTabBarImage, selectedImage: dragonHeadsActiveTabBarImage)
        dragonHeadsController.tabBarItem = dragonHeadsTabBarItem
        
        controllers.append(vowelConsonantViewController)
        controllers.append(diceViewController)
        controllers.append(moodSensorController)
        controllers.append(theGreatestViewController)
        controllers.append(dragonHeadsController)

        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        //tabController.delegate = self
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
}
