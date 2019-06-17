//
//  ViewController.swift
//  catalogo de filmes
//
//  Created by Mateus Fernandes on 06/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var filmes : [Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var filme : Filme
        let image1 = UIImage(named: "filme1")
        
        if image1 != nil{
            print("imagem nil")
        }else{
            print(image1)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film : Filme = filmes [ indexPath.row ]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = film.titulo
        celula.imageView?.image = film.imagem
        
        return celula
    }


}

