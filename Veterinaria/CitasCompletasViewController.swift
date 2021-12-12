//
//  CitasCompletasViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 09/12/21.
//

import UIKit

class CitasCompletasViewController: UIViewController {
    
    @IBOutlet weak var NombreLb: UILabel!
    @IBOutlet weak var DescLb: UILabel!
    
    var nombre:String!
    var desc:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        NombreLb.text = nombre
        DescLb.text = desc
    }
    

}
