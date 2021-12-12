//
//  CitasTableViewCell.swift
//  Veterinaria
//
//  Created by Mac10 on 09/12/21.
//

import UIKit

class CitasTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombreLb: UILabel!
    
    static let identifier = "celda"
    
    static func nib()->UINib {
        return UINib(nibName: "CitasTableViewCell", bundle: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
