//
//  MovieListViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 08/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var movies: [Movie]!

    class func newInstance(movies: [Movie]) -> MovieListViewController {
        let mlvc = MovieListViewController()
        mlvc.movies = movies
        return mlvc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieListViewController.movieCellId)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEditTableView)),
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchNewMovie))
        ]
    }

    @objc func touchEditTableView() {
        UIView.animate(withDuration: 0.33) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }

    @objc func touchNewMovie() {
        self.navigationController?.pushViewController(NewMovieViewController.newInstance(), animated: true)
    }
}

extension MovieListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removed = self.movies.remove(at: sourceIndexPath.row)
        self.movies.insert(removed, at: destinationIndexPath.row)
    }

    

    //Cette page permet d'accéder à la view de détail.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        let detail = MovieDetailViewController.newInstance(movie: movie)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {

    public static let movieCellId = "MOVIE_CELL_IDENTIFIER"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }

    /*
    // SANS XML
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: MovieListViewController.movieCellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: MovieListViewController.movieCellId)
        }
        cell.textLabel?.text = self.movies[indexPath.row].title
        return cell
    }
     */

    // AVEC XML
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListViewController.movieCellId, for: indexPath) as! MovieTableViewCell
        let movie = self.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.typeLabel.text = movie.type

        if movie.type == "marvel" {
            cell.typeImageView.image = UIImage(named: "s-l300")
        } else {
            cell.typeImageView.image = nil
        }

        if let releaseDate = movie.releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            cell.releaseDateLabel.text = dateFormatter.string(from: releaseDate)
        } else {
            cell.releaseDateLabel.text = "N/A"
        }

        return cell
    }
}
