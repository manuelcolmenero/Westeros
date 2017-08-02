//
//  DataSources.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

// Se crea una clase de repositorio de objetos
final class DataSources{
    
    // Función que construye un array de DataSource de House
    static func houseDataSource(model: [House]) -> ArrayDataSource<House>{
        return ArrayDataSource(model: model, cellMaker: { (house: House, UITableView: UITableView) -> UITableViewCell in
            let cellID = "Houses"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            
            return cell!
        })
    }
    
    // Función que construye un array de DataSource de Person
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        return ArrayDataSource(model: model, cellMaker: { (person: Person, UITableView: UITableView) -> UITableViewCell in
            let cellID = "Persons"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        })
    }
    
    // Función que construye un array de DataSource de Season
    static func seasonDataSource(model: [Season]) -> ArrayDataSource<Season>{
        return ArrayDataSource(model: model, cellMaker: { (season: Season, UITableView: UITableView) -> UITableViewCell in
            let cellID = "Season"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "\(season.name)"
            cell?.detailTextLabel?.text = "\(season.count) episodes"
            
            
            return cell!
        })
    }
    
    // Función que construye un array de DataSource de Episode
    static func episodeDataSource(model: [Episode]) -> ArrayDataSource<Episode>{
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, UITableView: UITableView) -> UITableViewCell in
            let cellID = "Episodes"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "Episode \(episode.numberInSeason) - \(episode.title)"
            cell?.detailTextLabel?.text = "\(episode.count) members"
            
            
            return cell!
        })
    }
}
