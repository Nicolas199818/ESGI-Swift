//
//  Memes.swift
//  SwiftProject
//
//  Created by Nicolas THIBAULT on 02/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import Foundation

public struct Memes {
    //On déclare les attributs :
    var titre: String
    var tag: String
    var image: String
    
    init(titre:String, tag:String, image:String){
        self.titre = titre
        self.tag = tag
        self.image = image
    }
    
}
