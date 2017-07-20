//
//  Repository.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 11/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Clase con propiedad estatica
final class Repository {
    
    static let local = LocalFactory()
}

// Protocolo de crear casas independiente del canal
protocol HouseFactory {
    
    // Se crea un typealias de función (clausura) que recibe una House y devuelve un Bool
    typealias Filter = (House)->Bool

    var houses : [House] {get}
    
    // Función que devuelve una casa a partir de su nombre
    func house(named : String) -> House?
    
    // Función que trata de obtener casa filtradas por algun criterio.
    func houses(filteredBy: Filter) -> [House]
    
}

// Función para crear modo local casas
final class LocalFactory : HouseFactory {

    var houses: [House]{
        get{
            // Aquí es donde se crean las casas
            
            // URLs
            let starkURL        = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL      = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL      = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL       = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            
            // Sigils
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormotSigil.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose on a green field")
            
            // Mayor Houses
            let stark       = House(name: "Stark",
                                    sigil: starkSigil,
                                    words: "Winter is coming",
                                    url: starkURL)
            let lannister   = House(name: "Lannister",
                                    sigil: lannisterSigil,
                                    words: "Hear me roar!",
                                    url: lannisterURL)
            let greyjoy     = House(name: "Greyjoy",
                                    sigil: greyjoySigil,
                                    words: "We Do Not Sow",
                                    url: greyjoyURL)
            let targaryen   = House(name: "Targaryen",
                                    sigil: targaryenSigil,
                                    words: "Fire and Blood",
                                    url: targaryenURL)
            let tyrell      = House(name: "Tyrell",
                                    sigil: tyrellSigil,
                                    words: "Growing Strong",
                                    url: tyrellURL)
            
            // Minor Houses
            // ---- Stark ----
            let mormont     = House(name: "Mormont",
                                    sigil: mormontSigil,
                                    words: "Here we stand!",
                                    url: mormontURL)
            
            // House Reed
            // House Glover
            // House Tully
            
            // ---- Lannister ----
            // House Frey
            // House Payne
            
            // ---- Tyrell ----
            // House Tarly
            
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
            let cersei  = Person(name: "Cersei", house: lannister)
            let lancel  = Person(name: "Lancel", house: lannister)
            
            // ---- Mormont ----
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            // ---- Greyjoy ----
            let asha    = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon   = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron   = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            
            // ---- Targaryen ----
            let daenerys    = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys     = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // ---- Tyrell ----
            let mace        = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras       = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery    = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna      = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // Add characters in houses
            // ---- Stark ----
            stark.add(persons: robb, sansa, arya, brandon, rickon)
            
            // ---- Lannister ----
            lannister.add(persons: tyrion, jaime, cersei, lancel)
            
            // ---- Mormont ----
            mormont.add(persons: lyanna)
            
            // ---- Greyjoy ----
            greyjoy.add(persons: asha, theon, euron)
            
            // ---- Targaryen ----
            targaryen.add(persons: daenerys, viserys)
            
            // ---- Tyrell ----
            tyrell.add(persons: mace, loras, margaery, olenna)
            
            
            // Add vassals in houses
            // ---- Stark ----
            stark.addMinorHouse(houses: mormont)
            
            
            return [stark, lannister, mormont, tyrell, greyjoy, targaryen].sorted()
        }
    }

    // se recibe como parametro un String y devuelve un objeto opcional House dado que puede devolver nil
    func house(named: String) -> House? {
        
        // Se parte de un array de houses y se le aplica una clausura filter
        
        /* 
            Si el objeto con nombre puesto en mayusculas coincide con el parametro recibido en
            mayusculas devuelve el objeto primero encontrado dado que se trabaja con un array de
            objetos y hay que devolver uno
        */
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
        
    }
    
    // Función que recibe House y devuelve un bool (Si pasa o no) y despues devuelve un array House con 
    // todos aquellos registros que han dado positivo
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
}
