//
//  ViewController.swift
//  Minhas Viagens
//
//  Created by Mateus Fernandes on 22/03/19.
//  Copyright © 2019 Growup. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var geoLocalizacao = CLLocationManager()
    var viagem : Dictionary<String, String > = [:]//dicionario vazio
    var indiceSelecionado : Int!
    
    func gereciaLocalizacao(){
        self.geoLocalizacao.delegate = self
        self.geoLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        self.geoLocalizacao.requestWhenInUseAuthorization()
        self.geoLocalizacao.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let indice = indiceSelecionado{
            if indice == -1 {
                gereciaLocalizacao()
            }else{
                exibeAnotacao(viagem: viagem)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(self.marcar(gesture:)))
        reconhecedorGesto.minimumPressDuration = 0.6
        mapa.addGestureRecognizer(reconhecedorGesto)
    }
    
    func exibeAnotacao(viagem: Dictionary<String, String >){
        
        
        if let localViagem = viagem["local"]{
            if let latitudeS = viagem["latitude"]{
                if let longitudeS = viagem["longitude"]{
                    if let latitude = Double(latitudeS){
                        if let longitude = Double(longitudeS){
                            
                            
                            let coordinate2d = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            let regiao = MKCoordinateRegion(center: coordinate2d, span: span)
                            
                            
                            let anotacao = MKPointAnnotation()
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            self.mapa.addAnnotation(anotacao)
                            mapa.setRegion(regiao, animated: true)
                            
                            
                        }
                    }
                }
            }
        }
        
    }
    
    
    @objc func marcar(gesture: UIGestureRecognizer){
        
        if(gesture.state == .began){
            let pontoSelecionado = gesture.location(in: self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            print(coordenadas.latitude)
            var localCompleto = "Endereço Não Localizado!!!"
            var nomeLocal = ""
            CLGeocoder().reverseGeocodeLocation(localizacao) { (local, erro) in
                //print(local?.first)
                
                if erro == nil{
                    if let dadosLocal = local?.first {
                
                        if let nome = dadosLocal.name {
                            nomeLocal = nome
                        }
                        
                        if let endereco = dadosLocal.thoroughfare {
                            localCompleto = endereco
                        }
                        
                   
                }else{
                    
                }
                    
                //salvando viagem
                self.viagem = ["local" : nomeLocal, "latitude" : String(coordenadas.latitude), "longitude": String(coordenadas.longitude)]
                ArmazenamentoDeDados().salvarViagens(viagem: self.viagem)
                    self.exibeAnotacao(viagem: self.viagem)
               
            }
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse{
            print(" not Authorized")
            
            let alertaController = UIAlertController(title: "Permissão de Acesso",
                                                     message: "Vá até as configurações para dar permissão a sua localização",
                                                     preferredStyle: .alert)
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações", style: .default) { (alertConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            }
            
            let acaoCancelar = UIAlertAction(title: "Cancelar",style: .cancel,handler: nil)
            
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            present(alertaController, animated: true, completion: nil)
            
        }
    }

}
}
