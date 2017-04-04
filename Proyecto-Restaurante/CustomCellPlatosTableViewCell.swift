//
//  CustomCellPlatosTableViewCell.swift
//  Proyecto-Restaurante
//
//  Created by German Alfredo Alvarenga on 27/3/17.
//  Copyright © 2017 GermanAlfredoAlvarenga. All rights reserved.
//

import UIKit

class CustomCellPlatosTableViewCell: UITableViewCell {
    
    
    @IBOutlet var imagenCellP: UIImageView!
    
    @IBOutlet var tituloCellP: UILabel!

    @IBOutlet var descripcionCellP: UILabel!
    
    @IBOutlet var precioCellP: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
