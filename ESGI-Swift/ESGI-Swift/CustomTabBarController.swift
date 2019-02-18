//
//  CustomTabBarController.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 16/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class CustomTabBarController : UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //On référence ensuite notre page home :
        //On dit sur quel page de la toolBar on se dirige.
        let homeClass = HomeClass()
        let homeClassController = UINavigationController(rootViewController:homeClass)
        homeClassController.tabBarItem.title = "Accueil"
        homeClassController.tabBarItem.image = UIImage(named: "icons8-accueil-30")
        
        //On référence ensuite notre view pour les tags
        let tagsViewController = createNavControllerWithImageTitle(title: "Tags", imageName:"icons8-hashtag-activity-feed-30")
        
        //On référence ensuite la page de jeu :
        let gameViewController = createNavControllerWithImageTitle(title: "Jeu", imageName: "icons8-manette-30")
        
        //On référence ensuite la page des settings :
        let settingsViewController = createNavControllerWithImageTitle(title: "Settings", imageName: "icons8-settings-30")
        viewControllers = [homeClassController,tagsViewController,gameViewController,settingsViewController]
    }
    
    //On fait une fonction qui retourne un navigation controller avec le titre ainsi que l'image :
    private func createNavControllerWithImageTitle(title: String,imageName:String) -> UINavigationController {
        let viewController = HomeClass()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named : imageName)
        return navController
    }
    
    
}
