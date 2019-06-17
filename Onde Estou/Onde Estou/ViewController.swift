//
//  ViewController.swift
//  Onde Estou
//
//  Created by Mateus Fernandes on 13/03/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var velocidade: UILabel!
    @IBOutlet weak var txtLongitude: UILabel!
    @IBOutlet weak var txtLatitude: UILabel!
    @IBOutlet weak var txtEndereco: UILabel!
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario : CLLocation = locations.last! // pega a ultima localização do usuario
        let longitude = localizacaoUsuario.coordinate.longitude
        let latitude = localizacaoUsuario.coordinate.latitude
        
        if localizacaoUsuario.speed > 0 {
            velocidade.text = String(localizacaoUsuario.speed)
        }else{
            velocidade.text = "0.00"
        }
        
        txtLatitude.text = String(latitude)
        txtLongitude.text = String(longitude)
        
        let coordinate2d = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let regiao = MKCoordinateRegion(center: coordinate2d, span: span)
        mapa.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
            
            if(erro == nil){
                if let dadosLocal = detalhesLocal?.first {
                    var thoroughfire = ""
                    if dadosLocal.thoroughfare != nil {
                        thoroughfire = dadosLocal.thoroughfare!
                    }
                    
                    var subThoroughfare = ""
                    if dadosLocal.subThoroughfare != nil {
                        subThoroughfare = dadosLocal.subThoroughfare!
                    }
                    
                    var locality = ""
                    if dadosLocal.locality != nil {
                        locality = dadosLocal.locality!
                    }
                    
                    var subLocality = ""
                    if dadosLocal.subLocality != nil {
                        subLocality = dadosLocal.subLocality!
                    }
                    
                    var country = ""
                    if dadosLocal.country != nil {
                        country = dadosLocal.country!
                    }
                    
                    self.txtEndereco.text = thoroughfire + " - "
                        + subThoroughfare + " - "
                        + subLocality + " - "
                        + locality + " - "
                        + country
                    
                }
            }else{
                
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

