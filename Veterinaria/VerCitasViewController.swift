//
//  VerCitasViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 09/12/21.
//

import UIKit
import CoreData

class VerCitasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var Tabla: UITableView!
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var indice: Int = 0
    
    var citas = [Citas]()
    
    var author: [String: AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Tabla.dataSource = self
        self.Tabla.delegate = self
        
        consultar()
        
        self.Tabla.register(CitasTableViewCell.nib(), forCellReuseIdentifier: CitasTableViewCell.identifier)
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.Tabla.reloadData()
        }
        print("viewWillAppear")
    }
    
    func consultar(){
        let fetch : NSFetchRequest <Citas> = Citas.fetchRequest()
        
        do {
            citas = try contexto.fetch(fetch)
        } catch let error as NSError {
            print("Error al cargar Datos")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = Tabla.dequeueReusableCell(withIdentifier: CitasTableViewCell.identifier, for: indexPath) as! CitasTableViewCell
        
        celda.nombreLb?.text = citas[indexPath.row].nombre
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indice = indexPath.row
        performSegue(withIdentifier: "DetalleSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destino = segue.destination as? CitasCompletasViewController else { return }
        destino.nombre = citas[indice].nombre
        destino.desc = citas[indice].descripcion
    }

}
