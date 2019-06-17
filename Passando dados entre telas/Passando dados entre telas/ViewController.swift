//
//  ViewController.swift
//  Passando dados entre telas
//
//  Created by Mateus Fernandes on 06/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //1 inserir uma view controller nova.
    //2 selecionar a view controller principal e ir em editor/embed in e navigation controller
    //3 selecionar o botáo na view controller principal segundando control e arrastar até a view controller que vai ser aberta
    //4 inserir uma classe para a nova view controller que foi criada. Novo arquivo e selecione a opção do cocoa file
    //5 em seguida selecione a nova view controller e clica na reguinha na barra da direita e vincula a classe na view controller.
    //6 crie um identificador para a segue. a segue é a seta com uma bola que liga as duas viewcontroller, para criar um identificador para ela basta clicar na segue, ir na regua e colocar um nome pra ela.
    
    @IBOutlet weak var campoEnviaDados: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //este if vai identificar qual a segue que foi chamada.
        //ou seja, qual botão que foi clicado.
        //e verifica da forma abaixo
        if segue.identifier == "enviarDados" {
            
            //instancia a detalhesViewController para acessar os atributos da classe.
            let vControllerDestino = segue.destination as! DetalhesViewController
            vControllerDestino.textoRecebido = campoEnviaDados.text!;
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

