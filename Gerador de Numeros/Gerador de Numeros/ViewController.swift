//
//  ViewController.swift
//  Gerador de Numeros
//
//  Created by Mateus Fernandes on 05/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var legendaResultado: UILabel!
    
    
    @IBAction func btnGeraNumeroAleatorio(_ sender: Any) {
        let numero = arc4random_uniform(11);
        legendaResultado.text = String(numero);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

