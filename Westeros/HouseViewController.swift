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
    
    func setupUI() {
        // Se crea un botón a la barra de navigationController
        
        // UIBarButtonItem >>> clase que representa un botón
        // target >>> Donde se va a ejecutar
        // action >>> Método que se ha de ejecutar
        let wiki    = UIBarButtonItem(title: "Wiki",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayWiki))
        
        // Se añade el boton a la barra de navigationController
        navigationItem.rightBarButtonItem = wiki
    }
    
    // @objc >> Indica que la función no pertenece a Swift sino a Objective-C.
    @objc func displayWiki() {
        // Se crea un wikiVC
        
        let wikiVC = WikiViewController(model: model)
        
        // Se carga el wikiVC en el navigationController
        navigationController?.pushViewController(wikiVC,
                                                 animated: true)
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
        
        setupUI()
        
        syncViewWithModel()
    }
    
}
