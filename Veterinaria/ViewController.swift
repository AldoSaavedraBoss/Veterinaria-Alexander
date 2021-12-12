//
//  ViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 03/12/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var UserTF: UITextField!
    @IBOutlet weak var PassTF: UITextField!
    
    var acceso = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func BtnAceptar(_ sender: Any) {
        if let email = UserTF.text, let pass = PassTF.text{
            Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
                if let result = result, error == nil{
                    self.acceso = 1
                    
                    /*self.navigationController?.pushViewController(InicioViewController(nibName: result.user.email!, bundle: nil), animated: true)*/
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Inicio" && self.acceso == 1 {
            //si vas a mandar parametros se ocupa, si no no
            let obj = segue.destination as! InicioViewController
         
        }
    }*/
}

