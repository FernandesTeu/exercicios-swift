//
//  ViewController.swift
//  Minhas Anotacoes
//
//  Created by Mateus Fernandes on 09/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textArea: UITextView!
    
    @IBAction func btnSalvarDados(_ sender: Any) {
        
        let conteudo : String!
        
        conteudo = textArea.text
        UserDefaults.standard.set(conteudo, forKey: "lista")
        
    }
   
    //esconde o teclado.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //esconder a barra de status do device.
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let recuperaDados : String
        
        
        if UserDefaults.standard.object(forKey: "lista") != nil {
            recuperaDados = UserDefaults.standard.object(forKey: "lista") as! String
            textArea.text = recuperaDados
            
        }else{
            
            textArea.text = "Nenhum dado armazenado"
        }
        
    }


}

