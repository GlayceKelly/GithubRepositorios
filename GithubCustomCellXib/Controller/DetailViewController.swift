//
//  DetailViewController.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 15/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var viewPrincipal: UIView!
    
    //Variaveis da classe
    var referenceForViewPrincipalGlobal: DetailRepositoriesView?
    var items: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregaXibs()
    }
    
    func carregaXibs() {
        //Atualiza o xib dentro da view principal
        if let referenceForViewPrincipal = Bundle.main.loadNibNamed("DetailRepositoriesView", owner: self, options: nil)?.first as? DetailRepositoriesView {
            viewPrincipal.addSubview(referenceForViewPrincipal)
            
            referenceForViewPrincipal.frame.size.height = viewPrincipal.frame.size.height
            referenceForViewPrincipal.frame.size.width = viewPrincipal.frame.size.width
            
            referenceForViewPrincipalGlobal = referenceForViewPrincipal
        }
        
        //Define a foto no imageview
        if let urlAvatar = URL(string: (items?.owner!.avatar_url)!) {
            //Realiza o download da imagem e apresenta no imageview
            referenceForViewPrincipalGlobal?.ivAvatarDatail.kf.indicatorType = .activity
            referenceForViewPrincipalGlobal?.ivAvatarDatail.kf.setImage(with: urlAvatar)
        } else {
            referenceForViewPrincipalGlobal?.ivAvatarDatail.image = nil
        }
        
        //Define os dados nos controles da view de detalhes
        referenceForViewPrincipalGlobal?.lbNameDetail.text = "\(items?.name ?? "Sem nome fornecido")"
        referenceForViewPrincipalGlobal?.lbDescription.text = "\(items?.description ?? "Sem descricao fornecida")"
    }

}
