//
//  ArmazenamentoDeDados.swift
//  Minhas Viagens
//
//  Created by Mateus Fernandes on 03/04/19.
//  Copyright © 2019 Growup. All rights reserved.
//

import Foundation

class ArmazenamentoDeDados{
    
    let chaveArmazenamento = "LocaisViagens"
    var viagens : [Dictionary<String , String>] = []
    
    func salvarViagens(viagem:Dictionary<String , String>){
        
        //lista viagens para não sobescrever o array.
        viagens = listarViagens()
        
        viagens.append( viagem  )
        
        getDefaults().set( viagens , forKey: chaveArmazenamento)
        getDefaults().synchronize()
    }
    
    func listarViagens() -> [ Dictionary<String, String > ] {
        let dados = getDefaults().object(forKey: chaveArmazenamento);
        
        if dados != nil {
            return dados as! Array
        }else{
            return []
        }
    }
    
    func removerViagens(indice : Int) {
        viagens = listarViagens()
        viagens.remove(at: indice)
        
        getDefaults().set( viagens , forKey: chaveArmazenamento)
        getDefaults().synchronize()
        
        
    }
    
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
}
