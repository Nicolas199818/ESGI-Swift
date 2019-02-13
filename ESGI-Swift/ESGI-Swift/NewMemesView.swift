//
//  NewMemesView.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 06/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class NewMemesView: UIViewController {
    //On rérence les élements graphique de la page afin de pouvoir les utiliser par la suite :
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagList: UIPickerView!
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    let myPickerController = UIImagePickerController()
    
    @IBAction func actionImage(_ sender: Any) {
        photoLibrary()
    }
    
    
    //On fait une fonction qui renvoie un NewMemesView afin de le passer dans pushNavigator
    public class func newInstance()-> NewMemesView{
        return NewMemesView()
    }
    
    //Code qui s'exécute lorsque la view se lance.
    override func viewDidLoad() {
        super.viewDidLoad()
        // On initialise les éléments graphiques
        self.titleLabel.text = "Titre"
        self.tagLabel.text = "Tag"
        self.imageLabel.text = "Image"
        self.cancelButton.setTitle("Annuler", for: .normal)
        self.validateButton.setTitle("Validate", for: .normal)
        self.imageButton.setTitle("Add Image", for: .normal)
        //On lie la view au delegate ainsi qu'au dataSource.
        self.tagList.dataSource = self
        self.tagList.delegate = self
        myPickerController.delegate = self
    }
    
    //
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //myPickerController est un contrôleur de vue qui gère les interfaces systèmes pour prendre des photos et aller dans la galery.
            myPickerController.allowsEditing = false
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    //Dis au delegate que le user a choisie une image. Le delegate sert à la gestion des évènements.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        memeImage.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelButton(_ sender: Any) {
        //On déclare la view que l'on veut rejoindre.
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func validateButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewMemesView : UIPickerViewDelegate{
    //C'est ce qui va renvoyer le bon titre au bon endroit dans la liste.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NewMemesView.availablesType[row]
    }
}

extension NewMemesView : UIPickerViewDataSource{
    static let availablesType = ["humour","horreur","animaux","fail","gaming","cinema","troll"]
    //On initialise la taille de la view et le nombre de compoant ainsi que le nombre de ligne par composant.
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NewMemesView.availablesType.count
    }
}

extension NewMemesView : UIImagePickerControllerDelegate{
    
}

extension NewMemesView : UINavigationControllerDelegate{
    
}
