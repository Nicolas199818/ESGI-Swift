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
    var isFinished = false
    
    
    private init(){
        
    }
    
    //On fait une fonction qui permet de récupérer les gifs à la mode :
    public func getTendencingMemes() -> [Memes]{
        var tableauMemes = [Memes]()
        let op = GiphyCore.shared.trending { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                //print(response.meta)
                //print(pagination)
                for result in data {
                    //print(result.images?.downsizedLarge?.gifUrl)
                    //print(result.title)
                    guard let images = result.images?.downsizedLarge?.gifUrl as? String  else {
                        return
                    }
                    guard let titles = result.title as? String else {
                        return
                    }
                    tableauMemes.append(Memes(title: titles ,url: images))
                    self.isFinished = true
                }
            } else {
                print("No Results Found")
            }
        }
        //On test
        while(isFinished == false){
            sleep(1)
        }
        return tableauMemes
    }
    
    
    //On fait une fonction qui permet de récupérer les gifs en relation avec ce tag :
    public func getTagsMemes(tag:String) -> [Memes]{
        var tableauMemes = [Memes]()
        let op = GiphyCore.shared.search(tag) { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                //print(response.meta)
                //print(pagination)
                for result in data {
                    //print(result.images?.downsizedLarge?.gifUrl)
                    //print(result.title)
                    guard let images = result.images?.downsizedLarge?.gifUrl as? String  else {
                        return
                    }
                    guard let titles = result.title as? String else {
                        return
                    }
                    tableauMemes.append(Memes(title: titles ,url: images))
                    self.isFinished = true
                }
            } else {
                print("No Results Found")
            }
        }
        //On test
        while(isFinished == false){
            sleep(1)
        }
        return tableauMemes
    }
    
}
