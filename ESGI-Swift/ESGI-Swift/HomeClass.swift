//
//  HomeClass.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 21/01/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class HomeClass: UIViewController {
    //On utilise un Outlet au moment où on veut référencer dans le code un élément graphique.
    @IBOutlet var tableView: UITableView!
    //On déclare une variable pour la liste des memes.
    var memes:[Memes]!
    
    //C'est une fonction qui ne varie pas ne fonction des différentes classes
    class func newInstance(memes:[Memes]) -> HomeClass{
        let mtvc = HomeClass()
        mtvc.memes = memes
        return mtvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //on met un tableau en paramètre :
        let test:Memes = Memes(title:"Le roi lion",type:"Dessin animé")
        memes = [Memes]()
        print(test)
        memes.append(test)
        memes.append(Memes(title:"La reine des neiges",type:"Dessin animé"))
        memes.append(Memes(title:"Mulan",type:"Dessin animé"))
        memes.append(Memes(title:"Coco",type:"Dessin animé"))
        
        
        
        //On déclare le delegate qui permet de gérer les sélections - configurer les en-tête et les pieds de pages, de supprimer et réorganiser les cellules.
        self.tableView.register(UINib(nibName: "MemesTableViewCell", bundle: nil), forCellReuseIdentifier: HomeClass.memesCellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
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

//The object must adopt UITableViewDelegate protocole : pour cela on extends ceci
extension HomeClass:UITableViewDelegate {
    //On fait une fonction qui permet de rentrer dans le détail de la view qui nous intéresse.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //On sélectionne le même en question à partir de l'indexPath
        let meme = memes[indexPath.row]
        let detail = MemesDetailViewController.newInstance(meme: meme)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension HomeClass:UITableViewDataSource {
    //On déclare la cellule qui sera afficher.
    public static let memesCellId = "MEMES_CELL_IDENTIFIER"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeClass.memesCellId, for:indexPath) as! MemesTableViewCell
        //C'est ici que l'on va récupérer le contenu de la cellule et le mettre dans le tableau
        let meme = self.memes[indexPath.row]
        cell.titleLabel.text = meme.title
        cell.typeMemes.text = meme.type
        //C'est ici que l'on va ajouter l'image de notre projet.
        cell.imageMemes.image = UIImage(named: "s-l300")
        return cell
    }
    
    //On déclare l'id mais je ne sais pas encore pourquoi ?
}

//Qu'est-ce que tu as fait actuellement ?
//Fait une view d'accueil en y implémentant de manière graphique une tableView
//Fait en sorte que ça démarre sur HomeClass
//Fait une classe Memes qui prend les informations essentielles (à modifier pour lire dans l'API).

//Quels sont les prochaines étapes du projets ?
// Faire le design d'une cellule de la tableView.
//Mettre plusieurs ligne tests sans connexion à l'API.
//Se connecter à l'API.
//Paramétrer Alamofire et tout le bordel
//Prendre les données et les afficher.
