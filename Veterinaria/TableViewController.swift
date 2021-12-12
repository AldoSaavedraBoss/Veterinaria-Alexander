//
//  TableViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 03/12/21.
//

import Foundation
import UIKit

/*struct PerrosData: Decodable {
    var message:String
}*/

class TableViewController: UITableViewController{
    let perrosManager = PerrosManager()
    
    
    @IBOutlet var tablaPerros: UITableView!
    @IBOutlet weak var ImgPerro: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let raza:String
        switch indexPath.row{
        case 0:
            raza = "labrador"
        case 1:
            raza = "doberman"
        case 2:
            raza = "pug"
        case 3:
            raza = "pitbull"
        case 4:
            raza = "chihuahua"
        case 5:
            raza = "komondor"
            
        default:
            raza = "labrador"
        }
        
        let url = "https://dog.ceo/api/breed/\(raza)/images/random"
        print(url)
        //solicitud(url: raza)
        perrosManager.completarURL(raza: raza)
    }
    
    func solicitud(url: String){
        //crear URL
        //print(url)
        if let url = URL(string: url){
            //Crear un sesion
            let sesion = URLSession(configuration: .default)
            //Asignar tarea a la sesion
            let tarea = sesion.dataTask(with: url, completionHandler: handle(datos:respuesta:error:))
            //Iniciar
            return tarea.resume()
            
        }
        
    }
    
    func handle(datos: Data?, respuesta: URLResponse?, error: Error?){
        if error != nil{
            print("Error en consultar la API \(error?.localizedDescription)")
            return
        }
        
        if let datosSeguros = datos {
            //let datosString = String(data: datosSeguros, encoding: .utf8)
            //let celda = tablaPerros.dequ
            
            if let decoded = try? JSONDecoder().decode(PerrosData.self, from: datosSeguros){
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: URL(string: decoded.message)!){
                        if let image = UIImage(data: data){
                            DispatchQueue.main.async {
                                self?.ImgPerro.image = image
                            }
                        }
                    }
                }
                print("URL de la imagen: \(decoded.message)")
            }
        }
    }
    
}



