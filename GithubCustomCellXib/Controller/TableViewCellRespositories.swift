//
//  TableViewCellRespositories.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 14/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class TableViewCellRespositories: UITableViewCell {
    //Controles da view
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(with items: Items) {
        lbName.text = items.name
        lbLanguage.text = items.language
        
        //Define a foto no imageview
        if let urlAvatar = URL(string: items.owner!.avatar_url) {
            //Realiza o download da imagem e apresenta no imageview
            self.ivAvatar.kf.indicatorType = .activity
            self.ivAvatar.kf.setImage(with: urlAvatar)
        } else {
            self.ivAvatar.image = nil
        }
        
        //Deixa a imagem arredondada
        ivAvatar.layer.cornerRadius = ivAvatar.frame.size.height/2
        ivAvatar.layer.borderColor = UIColor.black.cgColor
        ivAvatar.layer.borderWidth = 2
    }
}
