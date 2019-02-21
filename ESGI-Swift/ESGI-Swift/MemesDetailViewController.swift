//
//  MemesDetailViewController.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 31/01/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class MemesDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var image: UIImageView!
    public var meme:Memes!
    
    //On fait une fonction newInstance permettant de créer une instance de cette classe. Elle pourra ensuite être utilisé pour
    public class func newInstance(meme:Memes)->MemesDetailViewController{
        let detail = MemesDetailViewController()
        detail.meme = meme
        return detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.image = UIImage.gifImageWithURL(meme.url)
        self.type.text = "A Supprimer"
        self.titleLabel.text = meme.title
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
