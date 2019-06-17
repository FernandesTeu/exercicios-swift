//
//  ViewController.swift
//  IdadeDeCachorro
//
//  Created by Mateus Fernandes on 05/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var legendaResultado: UILabel!
    @IBOutlet weak var txtIdade: UITextField!
    
    //Metodo de quando o botão for precionado.
    @IBAction func descobrirIdade(_ sender: Any) {
        let idade = txtIdade.text;
        var resultado = 0;
        
        if idade != "" {
            resultado = Int(idade!)! * 7;
            legendaResultado.text = "A idade do seu cachorro em anos humanos é : " + String(resultado);
        }else{
            legendaResultado.text = "Informe a idade do seu cachorro." + String(resultado);
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

