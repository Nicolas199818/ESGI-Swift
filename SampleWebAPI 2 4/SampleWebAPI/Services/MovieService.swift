//
//  MovieService.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 08/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import Alamofire

public class MovieService {

    public static let `default` = MovieService()

    private init() {

    }

    public func getMovies(completion: @escaping ([Movie]) -> Void) {
        Alamofire.request("https://moc-3a-movies.herokuapp.com/").responseJSON { (res) in
            guard let m = res.value as? [[String: Any]] else {
                return
            }
            let movies = m.compactMap({ (elem) -> Movie? in
                return Movie(JSON: elem)
            })
            completion(movies) // Execute callback / closure
        }
    }

    public func insertMovie(_ movie: Movie, completion: @escaping (Bool) -> Void) {
        Alamofire.request("https://moc-3a-movies.herokuapp.com/", method: .post, parameters: movie.toJSON(), encoding: JSONEncoding.default).response { res in
            completion(res.response?.statusCode == 201)
        }
    }

    /**
     guard let url = URL(string: "https://moc-3a-movies.herokuapp.com/") else {
     return
     }
     let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
     guard let d = data,
     let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments),
     let m = json as? [[String: Any]] else {
     return
     }
     //let movies = m.compactMap { return Movie(json: $0) } // flatMap
     let movies = m.compactMap({ (elem) -> Movie? in
     return Movie(json: elem)
     })
     completion(movies) // Execute callback / closure
     }
     task.resume()
      */
}


