//
//  TarefasTableViewController.swift
//  Lista de Tarefas
//
//  Created by Mateus Fernandes on 10/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    var tarefas : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func atualizaListaTarefas(){
        let tarefa = Tarefa()
        tarefas = tarefa.listar()
        tableView.reloadData()//recarrega a tabela
    }
    //metodo que é executado quando a tela aparece para o usuario.
    override func viewDidAppear(_ animated: Bool) {
        atualizaListaTarefas()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tarefas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaTarefas", for: indexPath)

        cell.textLabel?.text = tarefas [ indexPath.row ]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let tarefa = Tarefa()
            tarefa.remover(indice: indexPath.row )
            atualizaListaTarefas()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
