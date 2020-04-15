//
//  ViewController.swift
//  GithubCustomCellXib
//
//  Created by Glayce on 14/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Controles da view
    @IBOutlet weak var btnLinguagemJava: UIButton!
    @IBOutlet weak var btnLinguagemSwift: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //Variaveis da classe
    var itemsJava: [Items] = []
    var itemsSwift: [Items] = []
    var repositories: Repositories!
    var currentPageJava: Int = 1
    var currentPageSwift: Int = 1
    var totalJava: Int = 0
    var totalSwift: Int = 0
    var loadJava: Bool = false
    var loadSwift: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCellRespositories.self, forCellReuseIdentifier: "cell")
            
        tableView.delegate = self
        tableView.dataSource = self
        
        //Acao dos botoes
        btnLinguagemJava.addTarget(self, action: #selector(loadReposJava), for: .touchUpInside)
        btnLinguagemSwift.addTarget(self, action: #selector(loadReposSwift), for: .touchUpInside)
    }
    
    //Carrega os repositorios passando a linguagem java
    @objc func loadReposJava() {
        let language = "java"
        
        //Define como true para indicar que esta buscando as informacoes de java
        loadJava = true
        loadSwift = false
        
        //Realiza a requisicao
        GithubAPI.loadRepos(language: language, page: currentPageJava) { (response) in
            if let infoResponse = response {
                //Obtem os repositorios
                self.repositories = infoResponse
                
                //Obtem o total de itens
                self.totalJava = self.repositories.total_count
                
                //Obtem os itens de dentro dos repositorios e adiciona no array
                self.itemsJava += self.repositories.items
                
                print("Total java: \(self.totalJava) - Já incluidos: \(self.itemsJava.count)")
                
                //Atualiza a lista
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //Carrega os repositorios passando a linguagem swift
    @objc func loadReposSwift() {
        let language = "swift"
        
        //Define como true para indicar que esta buscando as informacoes de java
        loadJava = false
        loadSwift = true
        
        //Realiza a requisicao
        GithubAPI.loadRepos(language: language, page: currentPageSwift) { (response) in
            if let infoResponse = response {
                //Obtem os repositorios
                self.repositories = infoResponse
                
                //Obtem o total de itens
                self.totalSwift = self.repositories.total_count
                
                //Obtem os itens de dentro dos repositorios e adiciona no array
                self.itemsSwift += self.repositories.items
                
                print("Total swift: \(self.totalSwift) - Já incluidos: \(self.itemsSwift.count)")

                //Atualiza a lista
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: Configuracao da table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Define as linhas conforme a linguagem que esta sendo buscada
        if loadJava {
            return self.itemsJava.count
        } else {
            return self.itemsSwift.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCellRespositories", owner: self, options: nil)?.first as! TableViewCellRespositories
        
        if loadJava {
            cell.prepareCell(with: itemsJava[indexPath.row])
        } else if loadSwift{
            cell.prepareCell(with: itemsSwift[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if loadJava {
            if indexPath.row == itemsJava.count - 10 && itemsJava.count != totalJava {
                //Incrementa a pagina
                currentPageJava += 1
                
                //Recarrega a proxima pagina dos repositorios java
                loadReposJava()
            }
        } else if loadSwift {
            if indexPath.row == itemsSwift.count - 10 && itemsSwift.count != totalSwift {
                //Incrementa a pagina
                currentPageSwift += 1
                
                //Recarrega a proxima pagina dos repositorios swift
                loadReposSwift()
            }
        }
    }
}

