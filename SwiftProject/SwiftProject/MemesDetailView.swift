//
//  MemesDetailView.swift
//  SwiftProject
//
//  Created by Nicolas THIBAULT on 02/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class MemesDetailView: UIViewController {
    @IBOutlet weak var titreMeme: UILabel!
    @IBOutlet weak var imageMeme: UIImageView!
    @IBOutlet weak var tagMeme: UILabel!
    var meme:Memes!
    
    //On fait une méthode newInstance pour initialiser la classe
    public class func newInstance(meme: Memes) -> MemesDetailView {
        let detail = MemesDetailView()
        detail.meme = meme
        return detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titreMeme.text = meme.titre
        self.tagMeme.text = meme.tag
        self.imageMeme.image = UIImage(named: meme.image)
        // Do any additional setup after loading the view.
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
