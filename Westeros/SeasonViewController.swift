//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 30/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonNameView: UILabel!
    
    @IBOutlet weak var seasonDateReleaseView: UILabel!
    
    @IBOutlet weak var seasonDateFinish: UILabel!
    
    @IBOutlet weak var seasonSynopsisView: UILabel!
    
    let model : Season
    
    init(model: Season) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.name
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

        if model.sortedChapters() != [] {
            let members    = UIBarButtonItem(title: "Episodes",
                                             style: .plain,
                                             target: self,
                                             action: #selector(displayEpisodes))
            buttonsArray.append(members)
        }
        
        // Se añaden los botones a la barra de navigationController
        navigationItem.rightBarButtonItems = buttonsArray
    }
    
    @objc func displayEpisodes() {
        // Se crea un membersVC
        
        let episodesVC = EpisodesViewController(model: model.sortedChapters())
        
        // Se carga el wikiVC en el navigationController
        navigationController?.pushViewController(episodesVC,
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // model -> view
        seasonNameView.text          = model.name
        seasonDateReleaseView.text   = formatter.string(from: model.dateRelease)
        seasonDateFinish.text        = formatter.string(from: model.dateFinish)
        seasonSynopsisView.text      = model.synopsis
    }
}
