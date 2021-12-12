//
//  CitasViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 06/12/21.
//

import UIKit
import CoreData

class CitasViewController: UIViewController {

    @IBOutlet weak var NombreLb: UITextField!
    @IBOutlet weak var ProblemaLb: UITextField!
    
    let verCitas = VerCitasViewController()
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BtnGuardar(_ sender: UIButton) {
        if NombreLb.text != "" && ProblemaLb.text != "" {
            let nombre = NombreLb.text
            let desc = ProblemaLb.text
            
            //Creando objeto cita
            let nuevaCita = Citas(context: self.contexto)
            nuevaCita.nombre = nombre
            nuevaCita.descripcion = desc
            
            //Guardando datos
            do {
                try self.contexto.save()
            } catch is Error {
                print("Error al guardar los datos")
            }
        }
    }
    
}
