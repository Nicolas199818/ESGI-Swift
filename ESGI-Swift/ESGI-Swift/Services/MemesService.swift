//
//  MemesService.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 20/02/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import Foundation
import GiphyCoreSDK
import ObjectMapper


public class MemesService {
    public static let `default` = MemesService()
    
    private init(){
        
    }
    
    //On fait une fonction qui permet de récupérer les gifs à la mode :
    public func getTendencingMemes(){
        let op = GiphyCore.shared.search("cats") { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                print(response.meta)
                print(pagination)
                for result in data {
                    print(result.images?.downsizedLarge?.gifUrl)
                    print(result.title)
                    //print(result.tags)
                }
            } else {
                print("No Results Found")
            }
        }
    }
}
