//
//  ViewController.swift
//  meus filmes
//
//  Created by Mateus Fernandes on 06/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allFilmes : [Filme] = []
    var allImages : [ UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var chat = UIImage(named: "filme1")
        var chatImageView = UIImageView(image: chat)
        
        
        var filme : Filme
        filme = Filme(titulo: <#T##String#>, descricao: <#T##String#>, img: chat)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFilmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //pega o filme atual e coloca na variavel
        let filmeAtual = allFilmes [ indexPath.row ] //recupera o filme do array allfilmes.
        
        //o identificador da table view cell que define na regua e em identify
        let celulaReuso = "celulaReuso"
        
        //aqui passa pra celula o indexPath e o identify da table view cell
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        
        //aqui passa pra label da celula o titulo do filme
        celula.textLabel!.text = filmeAtual.titulo
        return celula
    }

}

