//
//  DetalhesViewController.swift
//  Passando dados entre telas
//
//  Created by Mateus Fernandes on 06/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var detalheResultado: UILabel!
    var textoRecebido = "0";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detalheResultado.text = textoRecebido;
    }
    

   

}
