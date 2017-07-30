//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 30/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeNumberOvervallView: UILabel!

    @IBOutlet weak var episodeNumberInSeasonView: UILabel!
    
    @IBOutlet weak var episodeSynopsisView: UILabel!
    
    let model : Episode
    
    init(model: Episode) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Se crea un botón a la barra de navigationController
        
        var buttonsArray = [UIBarButtonItem]()
        
        // UIBarButtonItem >>> clase que representa un botón
        // target >>> Donde se va a ejecutar
        // action >>> Método que se ha de ejecutar
        
        if model.sortedMembers() != [] {
            let members    = UIBarButtonItem(title: "Members",
                                             style: .plain,
                                             target: self,
                                             action: #selector(displayMembers))
            buttonsArray.append(members)
        }
        
        // Se añaden los botones a la barra de navigationController
        navigationItem.rightBarButtonItems = buttonsArray
    }
    
    @objc func displayMembers() {
        // Se crea un membersVC
        
        let personsVC = MembersViewController(model: model.sortedMembers())
        
        // Se carga el wikiVC en el navigationController
        navigationController?.pushViewController(personsVC,
                                                 animated: true)
    }
    
    // Cuando aparece la vista se llama a sincronizar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
    
    // Se genera la función de sincronización
    func syncViewWithModel() {
        // model -> view
        episodeNumberOvervallView.text   = "\(model.numberOvervall)"
        episodeNumberInSeasonView.text   = "\(model.numberInSeason)"
        episodeSynopsisView.text         = model.synopsis
    }

}
