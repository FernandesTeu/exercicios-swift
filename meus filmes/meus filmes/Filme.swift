//
//  Filme.swift
//  meus filmes
//
//  Created by Mateus Fernandes on 06/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit


class Filme {
    
    var titulo:String!
    var descricao:String!
    var imagem:UIImage!
    
    init(titulo:String, descricao:String, img : UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = img
        
    }
}
