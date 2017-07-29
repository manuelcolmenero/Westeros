//
//  EpisodesViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
        
    
    // Propiedad para el modelo
    let model : [Episode]
    
    init (model: [Episode]) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        
        title       = "Episodes"
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
    
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Se crea el identificador de celda
        let cellID = "EpisodeCell"
        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let episode = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: cellID)
        }
        
        // Sincronizar Episode -> Cell
        cell?.textLabel?.text = "Episode \(episode.numberInSeason) - \(episode.title)"
        cell?.detailTextLabel?.text = "\(episode.count) members"
        
        return cell!
    }
    
    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // Se averigua la celda
        let episode   = model[indexPath.row]
        
        // Se muestra la celda
        let membersVC = MembersViewController(model: episode.sortedMembers())
        
        // Se carga el wikiVC en el navigationController
        navigationController?.pushViewController(membersVC,
                                                 animated: true)
    }

}
