//
//  NewMovieViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 29/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class NewMovieViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var typePickerView: UIPickerView!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var releaseDatePicker: UIDatePicker!
    @IBOutlet var submitButton: UIButton!

    public class func newInstance() -> NewMovieViewController {
        return NewMovieViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = NSLocalizedString("controller.newmovie.title", comment: "")
        self.releaseDateLabel.text = NSLocalizedString("controller.newmovie.release_date", comment: "")
        self.typeLabel.text = NSLocalizedString("controller.newmovie.type", comment: "")
        self.submitButton.setTitle(NSLocalizedString("controller.newmovie.submit", comment: ""), for: .normal)
        self.typePickerView.dataSource = self
        self.typePickerView.delegate = self
    }

    @IBAction func touchSubmit(_ sender: UIButton) {
        guard let title = self.titleTextField.text else {
            return
        }
        let selectedIndex = self.typePickerView.selectedRow(inComponent: 0)
        let date = self.releaseDatePicker.date
        let type = NewMovieViewController.availableTypes[selectedIndex]
        let movie = Movie(title: title, type: type, releaseDate: date)
        MovieService.default.insertMovie(movie) { (completed) in
            print(completed)
        }
    }
}

extension NewMovieViewController: UIPickerViewDataSource {

    static let availableTypes = ["animation", "aventure", "action", "drame", "sf"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NewMovieViewController.availableTypes.count
    }
}

extension NewMovieViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NewMovieViewController.availableTypes[row]
    }
}
