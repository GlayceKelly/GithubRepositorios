//
//  Items.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 14/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    let items: [Items]
    let total_count: Int
}

struct Items: Codable {
    let name: String?
    let language: String?
    let description: String?
    let owner: Owner?
}

struct Owner: Codable {
    let login: String
    let avatar_url: String
}
