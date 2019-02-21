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
    public func getTendencingMemes(completion: @escaping (Memes) -> Void)/* -> [Memes]*/{
        var tableauMemes = [Memes]()
        let op = GiphyCore.shared.trending { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                //print(response.meta)
                //print(pagination)
                for result in data {
                    print(result.images?.downsizedLarge?.gifUrl)
                    //print(result.title)
                    guard let images = result.images?.downsizedLarge?.gifUrl as? String  else {
                        return
                    }
                    guard let titles = result.title as? String else {
                        return
                    }
                    completion(Memes(title:titles,url:images))
                }
            } else {
                print("No Results Found")
            }
        }
        
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
        self.isFinished = false
        return tableauMemes
    }

    //On fait une fonction qui permet de récupérer les gifs en relation avec ce tag :
    public func getRandomMemes() -> Memes{
        var meme: Memes!
        print("test bababa 1")
        let op = GiphyCore.shared.random("cat") { (response, error) in
            print("blalablab")
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data  {
                print(data.images?.fixedHeightSmall?.gifUrl)
                print(data.title)
                guard let image = data.images?.fixedHeightSmall?.gifUrl as? String else {
                    return
                }
                guard let title = data.title as? String else {
                    return
                }
                meme = Memes(title: title, url: image)
                print("test 1 \(meme.url)")
                self.isFinished = true
            } else {
                print("No Result Found")
            }
        }
        //On test
        while(isFinished == false){
            sleep(1)
        }
        self.isFinished = false
        print("test 2 \(meme.url)")
        return meme
    }
}
