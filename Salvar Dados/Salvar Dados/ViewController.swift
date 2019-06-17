//
//  ViewController.swift
//  Salvar Dados
//
//  Created by Mateus Fernandes on 09/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //salva dados no device
        //UserDefaults.standard.set("Azul", forKey: "corFundo")
        
        //recupera dados gravados no device
        //let texto = UserDefaults.standard.object(forKey: "corFundo")
        //print(texto)
        
        //let comidas : [String] = ["Lazanha","pizza", "torta"]
        //UserDefaults.standard.set(comidas, forKey: "comidas")
        let comidasArr = UserDefaults.standard.object(forKey: "corFundo")
        print(comidasArr)
        
        //remover dados gravados no device.
        UserDefaults.standard.removeObject(forKey: "corFundo")
        UserDefaults.standard.removeObject(forKey: "comidas")
    }


}

