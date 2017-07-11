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

    var houses : [House] {get}
}

// Función para crear modo local casas
final class LocalFactory : HouseFactory {
    var houses: [House]{
        get{
            // Aquí es donde se crean las casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormotSigil.png"), description: "Rampant bear")
            
            let stark       = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
            let lannister   = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let mormont     = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!")
            
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime   = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            stark.add(person: robb)
            stark.add(person: arya)

            lannister.add(person: tyrion)
            lannister.add(person: jaime)
            
            mormont.add(person: lyanna)
            
            return [stark, lannister, mormont].sorted()
        }
    }

    
}
