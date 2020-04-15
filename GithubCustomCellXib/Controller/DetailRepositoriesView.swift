//
//  DetailRepositoriesViewController.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 15/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class DetailRepositoriesView: UIView {
    //Controles da view
    @IBOutlet weak var ivAvatarDatail: UIImageView!
    @IBOutlet weak var lbNameDetail: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    //Variaveis da classes
    var itemsJava: Items?
    var itemsSwift: Items?

    override func awakeFromNib() {
//        let name = itemsJava?.name ?? "Sem Nome"
//        let nameSwift = itemsSwift?.name ?? "Sem nome"
//
//        print("Itens Java: \(name)")
//        print("Itens Swift: \(nameSwift)")
    }
}
