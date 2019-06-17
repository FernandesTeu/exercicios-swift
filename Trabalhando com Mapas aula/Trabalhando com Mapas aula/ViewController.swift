//
//  ViewController.swift
//  Trabalhando com Mapas aula
//
//  Created by Mateus Fernandes on 11/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate , CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    
    var gerenciadorLocal = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurando Mapa
        // 1 - Clique sobre o projeto e vá ate Build Phases e clique em link Binary
        // e adicione a coreLocation.framework
        
        // 2 - Herdar de CLLocationManagerDelegate
        // e em seguinda instanciar o objeto
        // var gerenciadorLocal = CLLocationManager()
        
        /*CONFIGURAÇÕES DO MAPA*/
        //  - o objeto que gerencia é a propria classe
        gerenciadorLocal.delegate = self
        // Precisão desejada - melhor precisão. (kCLLocationAccuracyBest)
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.locationServicesEnabled()) {
            
            print("location Service Enable")
            // Autorização para utilizar a localização do usuario.
            // nesta parte é preciso fazer uma configuração adicional
            // 1 - clique no arquivo info.plist
            // require devices capabilities é aonde a gente solicita para que o device rode certinho
            // adicionar gps e location.services
            // 2 -  em information property list escolher a autorização para utilizar a localização
            // o value do campo é a mensagem que você irá exibir para o usuario.
            gerenciadorLocal.requestWhenInUseAuthorization()
            // atualizar a localização do usuario ( pegar em tempo real )
            gerenciadorLocal.startUpdatingLocation()
        }
        
        
    
        
        /*1 - define a latitude e a longitude com CLLocationCoordinate2D
        let location = CLLocationCoordinate2D(latitude: -19.818411,
                                              longitude: -43.989920)
        
        
        // 2 - cria o span da area do mapa...quanto menor o numero, maior será o zoom.
        let latSpan : CLLocationDegrees = 0.003
        let longSpan : CLLocationDegrees = 0.003
        let span = MKCoordinateSpan(latitudeDelta: latSpan, longitudeDelta: longSpan)
        
        // 3 - Define a regiao passando dados da location e do span.
        let region = MKCoordinateRegion(center: location, span: span)
        
        // 4 - seta a região no mapa.
        mapa.setRegion(region, animated: true)
        
        // 5 - exibindo marcador no mapa.
        
        let anotacao = MKPointAnnotation()
        anotacao.coordinate = location
        anotacao.title = "Minha Casa"
        anotacao.subtitle = "Lar doce Lar"
        
        mapa.addAnnotation( anotacao )*/
    }
    
    //Metodo que recupera a posição em tempo real do gps.
    // estas informações estão no array locations do tipo CLLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locat : CLLocation = locations.last! // last pega o último valor do array
        let location = CLLocationCoordinate2D(latitude: locat.coordinate.latitude ,longitude:locat.coordinate.longitude)
        let latSpan : CLLocationDegrees = 0.01
        let longSpan : CLLocationDegrees = 0.01
        let span = MKCoordinateSpan(latitudeDelta: latSpan, longitudeDelta: longSpan)
        let region = MKCoordinateRegion(center: location, span: span)
        mapa.setRegion(region, animated: true)
        
    }

}

