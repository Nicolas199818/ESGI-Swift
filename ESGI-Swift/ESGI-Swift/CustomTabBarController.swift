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
        var memes = [Memes]()
        memes.append(Memes(title:"La reine des neiges",type:"Dessin animé"))
        memes.append(Memes(title:"Mulan",type:"Dessin animé"))
        memes.append(Memes(title:"Coco",type:"Dessin animé"))
        memes.append(Memes(title:"Le roi Lion",type:"Dessin animé"))
        
        let homeClassController = createNavControllerWithImageTitle(title: "Accueil", imageName: "icons8-accueil-30", view: HomeClass.newInstance(memes: memes))
        
        var tableTag : [Tag]! = [Tag]()
        tableTag.append(Tag(tag: "humour"))
        tableTag.append(Tag(tag: "animaux"))
        tableTag.append(Tag(tag: "horreur"))
        tableTag.append(Tag(tag: "cinéma"))
        tableTag.append(Tag(tag: "troll"))
        
        //On référence ensuite notre view pour les tags
        //Il faudra trouver le moyen de faire ceci dynamiquement :
        let tagsViewController = createNavControllerWithImageTitle(title: "Tags", imageName:"icons8-hashtag-activity-feed-30",view: TagViewController.newInstance(tags: tableTag))
        
        //On référence ensuite la page de jeu :
        let gameViewController = createNavControllerWithImageTitle(title: "Jeu", imageName: "icons8-manette-30",view: GameViewController())
        
        //On référence ensuite la page des settings :
        let settingsViewController = createNavControllerWithImageTitle(title: "Settings", imageName: "icons8-settings-30",view: HomeClass.newInstance(memes: memes))
        viewControllers = [homeClassController,tagsViewController,gameViewController,settingsViewController]
        
    }
    
    //On fait une fonction qui retourne un navigation controller avec le titre ainsi que l'image :
    private func createNavControllerWithImageTitle(title: String,imageName:String,view:UIViewController) -> UINavigationController {
        let viewController = view
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named : imageName)
        self.dismiss(animated: true, completion: nil)
        return navController
    }
    
    
}
