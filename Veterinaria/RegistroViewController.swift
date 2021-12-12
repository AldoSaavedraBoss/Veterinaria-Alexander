//
//  RegistroViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 04/12/21.
//

import UIKit
import FirebaseAuth

class RegistroViewController: UIViewController {

    @IBOutlet weak var UserTF: UITextField!
    @IBOutlet weak var PassTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BtnAceptar(_ sender: Any) {
        if let email = UserTF.text, let pass = PassTF.text{
            Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(ViewController(), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se produjo un error registrando al usuario", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    

}
