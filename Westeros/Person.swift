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
    init(name: String, alias: String, house: House) {
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    init(name: String, house: House) {
        self.name   = name
        self.house  = house
        _alias      = nil
    }
}
