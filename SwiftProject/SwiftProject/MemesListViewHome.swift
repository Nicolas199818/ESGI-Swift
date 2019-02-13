//
//  MemesListViewHome.swift
//  SwiftProject
//
//  Created by Nicolas THIBAULT on 02/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class MemesListViewHome: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var memes:[Memes]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.memes = ServiceMemes.default.getMovies()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "MemesTableViewCell", bundle: nil), forCellReuseIdentifier: MemesListViewHome.memeCellId)
        //On ajoute le bouton d'édition
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEditTableView)),
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchNewMovie))
        ]
        // Do any additional setup after loading the view.
    }

    @objc func touchEditTableView() {
        UIView.animate(withDuration: 0.33) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }
    
    @objc func touchNewMovie() {
        //self.navigationController?.pushViewController(NewMovieViewController.newInstance(), animated: true)
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
//Faire apparaître les cellules contenant les informations du tableau

extension MemesListViewHome:UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removed = self.memes.remove(at: sourceIndexPath.row)
        self.memes.insert(removed, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = self.memes[indexPath.row]
        let detail = MemesDetailView.newInstance(meme: meme)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension MemesListViewHome:UITableViewDataSource{
    public static let memeCellId:String = "MemesTabCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemesListViewHome.memeCellId,for: indexPath) as! MemesTableViewCell
        let meme = self.memes[indexPath.row]
        cell.tagMemes.text = meme.tag
        cell.imageTable.image = UIImage(named:meme.image)
        cell.titre.text = meme.titre
        
        return cell
    }
    
    
}
