//
//  SeasonsViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class SeasonsViewController: UITableViewController {
        
    // Propiedad para el modelo
    let model : [Season]
    
    init (model: [Season]) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        
        title       = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    
    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // Se averigua la celda
        let season   = model[indexPath.row]
        
        // Se muestra la celda
        let seasonVC = SeasonViewController(model: season)
        navigationController?.pushViewController(seasonVC, animated: true)
        
    }

}
