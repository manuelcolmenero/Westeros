//
//  HouseViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 10/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var houseWordsView: UILabel!
    
    @IBOutlet weak var houseSigilImageView: UIImageView!
    
    
    // Se importa el modelo
    let model : House
    
    // Se inicializa el modelo
    init(model: House) {
        // Se inicializan las variables del modelo
        self.model = model
        
        // Se llama al inicializador de Super
        super.init(nibName: nil, bundle: nil)
        
        // Se informa el titulo de la vista
        title = model.name
    }
    
    // Chapuza de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Se genera la función de sincronización
    func syncViewWithModel() {
        // model -> view
        houseNameView.text          = "House \(model.name)"
        houseSigilImageView.image   = model.sigil.image
        houseWordsView.text         = model.words
    }
    
    // Cuando aparece la vista se llama a sincronizar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }
    
}
