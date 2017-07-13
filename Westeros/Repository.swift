//
//  Repository.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 11/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Se crea un typealias de función (clausura) que recibe una House y devuelve un Bool
typealias FilteredBy = (House) -> Bool

// Clase con propiedad estatica
final class Repository {
    
    static let local = LocalFactory()
}

// Protocolo de crear casas independiente del canal
protocol HouseFactory {

    var houses : [House] {get}
    
    // Función que devuelve una casa a partir de su nombre
    func house(named : String) -> House?
    
    // Función que trata de obtener casa filtradas por algun criterio.
    func houses(filter: FilteredBy) -> [House]?
    
}

// Función para crear modo local casas
final class LocalFactory : HouseFactory {

    var houses: [House]{
        get{
            // Aquí es donde se crean las casas
            
            // Sigils
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormotSigil.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose on a green field")
            
            // Houses
            let stark       = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
            let lannister   = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let mormont     = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!")
            let greyjoy     = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow")
            let targaryen   = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood")
            let tyrell      = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong")
            
            
            // Characters
            // ---- Stark ----
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)

            
            // ---- Lannister ----
            let tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime   = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei   = Person(name: "Cersei", house: lannister)
            
            // ---- Mormont ----
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon  = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron  = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            
            // ---- Targaryen ----
            let daenerys  = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // ---- Tyrell ----
            let mace  = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras  = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery  = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna  = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // Add characters in houses
            // ---- Stark ----
            stark.add(person: robb)
            stark.add(person: sansa)
            stark.add(person: arya)
            stark.add(person: brandon)
            stark.add(person: rickon)
            
            // ---- Lannister ----
            lannister.add(person: tyrion)
            lannister.add(person: jaime)
            lannister.add(person: cersei)
            
            // ---- Mormont ----
            mormont.add(person: lyanna)
            
            // ---- Greyjoy ----
            greyjoy.add(person: asha)
            greyjoy.add(person: theon)
            greyjoy.add(person: euron)
            
            // ---- Targaryen ----
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            
            // ---- Tyrell ----
            tyrell.add(person: mace)
            tyrell.add(person: loras)
            tyrell.add(person: margaery)
            tyrell.add(person: olenna)
            
            return [stark, lannister, mormont, tyrell, greyjoy, targaryen].sorted()
        }
    }

    func house(named: String) -> House? {
        return houses.filter({ (house: House) -> Bool in
            return house.name == named
        }).first
    }
    
    func houses(filter: FilteredBy) -> [House]? {
        return houses.filter(filter)
    }
    
}
