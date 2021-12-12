//
//  PerrosManager.swift
//  Veterinaria
//
//  Created by Mac10 on 03/12/21.
//

import Foundation

struct PerrosManager {
    
    
    func completarURL(raza:String){
        let url = "https://dog.ceo/api/breed/\(raza)/images/random"
        print(url)
        return solicitud(url: url)
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
            
            if let decoded = try? JSONDecoder().decode(PerrosData.self, from: datosSeguros){
                print(decoded.message)
            }
        }
    }
}

struct PerrosData: Decodable {
    var message:String
}
