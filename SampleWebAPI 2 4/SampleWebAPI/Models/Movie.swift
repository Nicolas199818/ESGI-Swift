//
//  Movie.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 10/12/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Movie: ImmutableMappable {

    var title: String
    var releaseDate: Date?
    var type: String

    static func buildDateTransformer() -> DateFormatterTransform {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return DateFormatterTransform(dateFormatter: dateFormatter)
    }

    public init(map: Map) throws {
        self.title = try map.value("title")
        self.type = try map.value("type")
        self.releaseDate = try? map.value("releaseDate", using: Movie.buildDateTransformer())
    }

    public func mapping(map: Map) {
        self.title >>> map["title"]
        self.type >>> map["type"]
        self.releaseDate >>> (map["releaseDate"], Movie.buildDateTransformer())
    }

    init(title: String, type: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
        self.type = type
    }
}
