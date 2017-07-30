//
//  Episode.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

// Se crea un conjunto de personas
typealias CharInEpisode = Set<Person>

final class Episode{
    let numberOvervall    : Int
    let numberInSeason    : Int
    let title             : String
    let season            : Season
    
    private var _members : CharInEpisode
    
    init(numberOvervall: Int, numberInSeason: Int, title: String, season: Season) {
        (self.numberOvervall, self.numberInSeason, self.title, self.season) = (numberOvervall, numberInSeason, title, season)
        _members = CharInEpisode()
    }
}

// MARK: - Extensión para CharInEpisode
extension Episode{
    
    // Extension de propiedad
    var count : Int{
        return _members.count
    }
    
    // Extension de método
    func add(person: Person) {
        
        _members.insert(person)
    }
    
    // Sobrecarga de funciones. Se crea la misma función con distintos parámetros
    
    // Los '...' son Variadic versión. Quiere decir que puede recibir varios parámetros separados por comas.
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // se pasa como parámetro un array
    func add(personArray: [Person]){
        for person in personArray{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    // Se crea un metodo que devuelve un array de personas
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
}


// MART: - Propiedades
extension Episode {
    var proxy : String {
        return "\(numberOvervall) \(numberInSeason) \(season.name)"
    }
}

// MART: - Hashable
extension Episode : Hashable {
    var hashValue: Int {
        get{
            return proxy.hashValue
        }
    }
}

// MART: - Equatable
extension Episode : Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MART: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
