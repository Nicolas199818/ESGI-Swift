//
//  ViewController.swift
//  SwiftProject
//
//  Created by Nicolas THIBAULT on 02/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var memes:[Memes]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // On charge le tableau de memes :
        self.memes = ServiceMemes.default.getMovies()
        print(self.memes[0])
    }


}

