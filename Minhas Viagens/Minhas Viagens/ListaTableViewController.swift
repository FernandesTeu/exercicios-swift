//
//  ListaTableViewController.swift
//  Minhas Viagens
//
//  Created by Mateus Fernandes on 22/03/19.
//  Copyright © 2019 Growup. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController {
    
    var minhasViagens :[Dictionary<String, String>] = []
    var controleNavegacao = "adicionar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        controleNavegacao = "Adicionar"
        atualizarViagens()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.minhasViagens.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let viagem = self.minhasViagens [ indexPath.row ]["local"]
       let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        
        cell.textLabel?.text = viagem
        // Configure the cell...

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            ArmazenamentoDeDados().removerViagens( indice: indexPath.row )
            
            atualizarViagens()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func atualizarViagens(){
        minhasViagens = ArmazenamentoDeDados().listarViagens()
        tableView.reloadData()
    }
    //recupera o indice que foi selecionado
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.controleNavegacao = "listar"
        performSegue(withIdentifier: "mapSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let viewControllerDestino = segue.destination as! ViewController
            if let indiceRecuperado = sender{
                if self.controleNavegacao == "listar" {
                    let indice = indiceRecuperado as! Int
                    viewControllerDestino.viagem = minhasViagens[ indice ]
                    viewControllerDestino.indiceSelecionado =  indice
                    
                }else{
                    viewControllerDestino.viagem  = [:]
                    viewControllerDestino.indiceSelecionado = -1
                }
            }
        }
    }
    

}
