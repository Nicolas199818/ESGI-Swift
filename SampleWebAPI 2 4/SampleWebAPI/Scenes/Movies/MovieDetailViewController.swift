//
//  MovieDetailViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 29/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet var movieTitleLabel: UILabel!
    public var movie: Movie!

    public class func newInstance(movie: Movie) -> MovieDetailViewController {
        let detail = MovieDetailViewController()
        detail.movie = movie
        return detail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTitleLabel.text = self.movie.title
    }
}
