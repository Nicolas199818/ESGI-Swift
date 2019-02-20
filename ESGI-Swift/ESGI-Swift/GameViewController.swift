//
//  GameViewController.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 18/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadButton.setTitle("Charger un Memes", for: .normal)
        self.loadButton.titleLabel?.font = UIFont(name:"Helvetica",size:40)

        // Do any additional setup after loading the view.
    }

    @IBAction func loadGif(_ sender: Any) {
        self.memeImage.image = UIImage(named:"s-l300")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
