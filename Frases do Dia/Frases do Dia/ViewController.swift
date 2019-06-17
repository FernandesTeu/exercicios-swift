//
//  ViewController.swift
//  Frases do Dia
//
//  Created by Mateus Fernandes on 05/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var legendaFrase: UILabel!
    
    @IBAction func gerarFrases(_ sender: Any) {
        
        var frases:[String] = [];
        frases.append("Cada macaco no seu galho");
        frases.append("Nada melhor como um dia após o outro");
        frases.append("Diga-me com quem tu andas, e eu te direi se serás roubado");
        frases.append("Brasil acima de tudo, Deus acima de todos");
        frases.append("E conhecereis a verdade, e a verdade vos libertará");
        
        let totIdx = frases.count;
        let idxRandom = arc4random_uniform(UInt32(totIdx));
        
        legendaFrase.text = frases[Int(idxRandom)];
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

