//
//  TagViewController.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 18/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {
    
    
    
    @IBOutlet var tableView: UITableView!
    var tags:[Tag]!
    
    
    class func newInstance(tags:[Tag]) -> TagViewController{
        let tagVC = TagViewController()
        tagVC.tags = tags
        return tagVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On attache le delegate et data source de la table view au comportement défini dans les extends.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //On fait le lien entre la tablView et le design des cellules.
        self.tableView.register(UINib(nibName: "tagTableViewCell", bundle: nil), forCellReuseIdentifier: TagViewController.tagCellId)
        
    }
}


//On déclare le delegate.Ce qui gère les évènements.
extension TagViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = self.tags[indexPath.row]
        print(tag)
        var memes = MemesService.default.getTagsMemes(tag: tag.tag)
        let listMemesTag = HomeClass.newInstance(memes: memes)
        self.navigationController?.pushViewController(listMemesTag, animated: true)
        
    }
}

//Permet la gestion des datas de la tableView
extension TagViewController:UITableViewDataSource{
    public static let tagCellId = "TagTableViewCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    //C'est ici que l'on initialise le contenu d'une cellule.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TagViewController.tagCellId, for: indexPath) as! tagTableViewCell
        //On récupère le tag en question
        let tag = self.tags[indexPath.row]
        cell.labelTagCell.text = tag.tag
        return cell
    }
    
    
}
