//
//  Character.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Representación del módelo
// MARK: - Classes
final class Person{
    
    // Campos obligatorios
    let name    : String
    let house   : House
    
    // Campos opcionales
    private let _alias   : String?
    
    var alias   : String{
        get{
            return _alias ?? ""
        }
    }
    
    // Inicializador designado
    init(name: String, alias: String?, house: House) {
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    // Inicializador de conveniencia sin extender la clase
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
}


// MARK: - Extensiones
extension Person{
    var fullName : String{
        get{
            return  "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house.name)"
    }
}
extension Person : Hashable {
    var hashValue: Int {
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
