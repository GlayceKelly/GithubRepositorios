//
//  GithubAPI.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 14/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation
import Alamofire

class GithubAPI {
    static private let basePath = "https://api.github.com/search/repositories?"
    static private let limit = 50

    class func loadRepos(language: String, page: Int = 0, onComplete: @escaping (Repositories?) -> Void) {
        
        let url = basePath + "page=\(page)&per_page=\(limit)&q=language:\(language)&sort=stars/"
        
        print("URL completa: \(url)")
        
        //Realiza a comunicacao com a api do github atraves do alamofire
        AF.request(url).responseJSON { (response) in
            //Obtem o retorno da api
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            
            do {
                //Convertendo o tipo para o objeto
                let repos = try JSONDecoder().decode(Repositories.self, from: data)
                onComplete(repos)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
}
