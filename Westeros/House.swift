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

// Se crea un conjunto de casas menores
typealias MinorHouse = Set<House>

// MARK: - Classes
final class House{
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    
    private var _members : Members
    private var _minorHouses : MinorHouse
    
    init(name : String, sigil : Sigil, words : Words, url: URL) {
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
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
    
    // Sobrecarga de funciones. Se crea la misma función con distintos parámetros
    
    // Los '...' son Variadic versión. Quiere decir que puede recibir varios parámetros separados por comas.
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    // Se crea un metodo que devuelve un array de personas
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
    
    // Parte Minor House para guardar House en House
    
    // Extension de propiedad
    var countMinorHouse : Int{
        return _minorHouses.count
    }
    
    // Extension de método
    func addMinorHouse(house: House) {
        
        guard house.proxyForEquality != self.proxyForEquality else {
            return
        }
        
        _minorHouses.insert(house)
    }
    
    // Sobrecarga de función addMinorHouse para incluir varias casas unas dentro de otra
    func addMinorHouse(houses: House...){
        for house in houses{
            addMinorHouse(house: house)
        }
    }
}

extension House {
    
    // Variable para igualdad de objetos
    var proxyForEquality: String {
        get {
            return "\(name) \(words) \(count)"
        }
    }
    
    
    // Variable para ordenar objetos
    var proxyForComparison: String {
        get {
            return name.uppercased()
        }
    }
}

// MART_ - Hashable
extension House: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

// MART_ - Equatable
extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MART_ - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
