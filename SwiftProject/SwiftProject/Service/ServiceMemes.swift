//
//  ServiceMemes.swift
//  SwiftProject
//
//  Created by Nicolas THIBAULT on 02/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import Foundation
public class ServiceMemes {
    public static let `default` = ServiceMemes()
    
    public func getMovies()->[Memes]{
        var listMemes:[Memes] = []
        listMemes.append(Memes(titre:"La reine des neiges",tag:"dessin animée",image:"s-l300"))
        listMemes.append(Memes(titre:"Le roi lion",tag:"dessin animée",image:"s-l300"))
        listMemes.append(Memes(titre:"Coco",tag:"dessin animée",image:"s-l300"))
        listMemes.append(Memes(titre:"Mulan",tag:"dessin animée",image:"s-l300"))
        listMemes.append(Memes(titre:"Frère des ours",tag:"dessin animée",image:"s-l300"))
        return listMemes
    }
    
}
//Cette classe sert pour l'instant à renvoyé un tableau de memes.
