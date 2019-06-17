//
//  ViewController.swift
//  PokemonGO
//
//  Created by Mateus Fernandes on 01/05/19.
//  Copyright © 2019 Growup. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var managerLocation = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quem vai gerenciar os objetos é a propria classe
        managerLocation.delegate = self
        
        //solicitando autorização para o usuario
        managerLocation.requestWhenInUseAuthorization()
        managerLocation.startUpdatingLocation()
        
    }
    
    
    //exibindo alerta para que o usuário dê autorização de utilização do app.
    //Este método que verifica se o usuario autorizou ou não a utlização da localização
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //se o status é diferente de autorizado.
        if status != .authorizedWhenInUse{
           
            //criar a janela
            let alertaController = UIAlertController(title: "Permissão de Acesso",
                                                     message: "Vá até as configurações para dar permissão a sua localização",
                                                     preferredStyle: .alert)
            
            //cria o botão para abrir configurações
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações", style: .default) { (alertConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            }
            
            //Cria o botão para cancelar a ação
            let acaoCancelar = UIAlertAction(title: "Cancelar",style: .cancel,handler: nil)
            
            //Adicionando ações no alerta controller.
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            //apresentando na tela.
            present(alertaController, animated: true, completion: nil)
            
        }
    }


}

