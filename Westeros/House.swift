//
//  House.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

// Representación del módelo
// MARK: - typealias
typealias Words = String

// Se crea un conjunto de personas
typealias Members = Set<Person>

// Se crea un conjunto de personas
typealias MinorHouse = Set<House>

// MARK: - Classes
final class House{
    let name    : String
    let sigil   : Sigil
    let words   : Words
    
    private var _members : Members
    private var _minorHouses : MinorHouse
    
    init(name : String, sigil : Sigil, words : Words) {
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
        _minorHouses = MinorHouse()
    }
}

final class Sigil{
    let description : String
    let image       : UIImage
    
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
    
}

// MARK: - Extensión
extension House{

    // Extension de propiedad
    var count : Int{
        return _members.count
    }
    
    // Extension de método
    func add(person: Person) {
        
        guard person.house.name == name else {
            return
        }
        
        _members.insert(person)
    }
    
    // Parte Minor House para guardar House en House
    
    // Extension de propiedad
    var countMinorHouse : Int{
        return _minorHouses.count
    }
    
    // Extension de método
    func addMinorHouse(house: House) {
        
        guard house.proxy != self.proxy else {
            return
        }
        
        _minorHouses.insert(house)
    }
}

extension House {
    var proxy: String {
        get {
            return "\(name) \(sigil.description) \(words)"
        }
    }
}

extension House: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}


extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
