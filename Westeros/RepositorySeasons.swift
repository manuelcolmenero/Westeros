//
//  RepositorySeasons.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//


import Foundation

// Clase con propiedad estatica
final class RepositorySeasons {
    
    static let local = SeasonLocalFactory()
}

// Mark: - HouseFactory

// Protocolo de crear casas independiente del canal
protocol SeasonFactory {
    
    // Se crea un typealias de función (clausura) que recibe una House y devuelve un Bool
    typealias Filter = (Season)->Bool
    
    var seasons : [Season] {get}
    
    // Función que devuelve una casa a partir de su nombre
    func season(numered : Int) -> Season?
    
    // Función que trata de obtener casa filtradas por algun criterio.
    func season(filteredBy: Filter) -> [Season]
    
}

// Mark: - LocalFactory
// Función para crear modo local casas
final class SeasonLocalFactory : SeasonFactory {

    var seasons: [Season]{
        get{
            
            
            // Se recuperan las casas
            let stark      = Repository.local.house(named: "Stark")
            let lannister  = Repository.local.house(named: "Lannister")
            let mormont    = Repository.local.house(named: "Mormont")
            let targaryen  = Repository.local.house(named: "Targaryen")
            let greyjoy    = Repository.local.house(named: "Greyjoy")
            let tyrell     = Repository.local.house(named: "Tyrell")
            
            // Se recuperan las personas
            // Characters
            
            var arrayPersons = [Person]()
            
            // ---- Stark ----
            arrayPersons.append(Person(name: "Robb", alias: "The young wolf", house: stark!))
            arrayPersons.append(Person(name: "Sansa", alias: "Little bird", house: stark!))
            arrayPersons.append(Person(name: "Arya", house: stark!))
            arrayPersons.append(Person(name: "Brandon", alias: "The winged wolf", house: stark!))
            arrayPersons.append(Person(name: "Rickon", house: stark!))
            
            
            // ---- Lannister ----
            arrayPersons.append(Person(name: "Tyrion", alias: "The Imp", house: lannister!))
            arrayPersons.append(Person(name: "Jaime", alias: "KingSlayer", house: lannister!))
            arrayPersons.append(Person(name: "Cersei", house: lannister!))
            arrayPersons.append(Person(name: "Lancel", house: lannister!))
            
            // ---- Mormont ----
            arrayPersons.append(Person(name: "Lyanna", house: mormont!))
            
            // ---- Greyjoy ----
            arrayPersons.append(Person(name: "Asha", alias: "Esgred", house: greyjoy!))
            arrayPersons.append(Person(name: "Theon", alias: "Reek", house: greyjoy!))
            arrayPersons.append(Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy!))
            
            // ---- Targaryen ----
            arrayPersons.append(Person(name: "Daenerys", alias: "Dragonmother", house: targaryen!))
            arrayPersons.append(Person(name: "Viserys", alias: "The Beggar King", house: targaryen!))
            
            // ---- Tyrell ----
            arrayPersons.append(Person(name: "Mace", alias: "Lord Oaf", house: tyrell!))
            arrayPersons.append(Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell!))
            arrayPersons.append(Person(name: "Margaery", alias: "Little rose", house: tyrell!))
            arrayPersons.append(Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell!))
            
            // Aquí es donde se crean las temporadas
            let season1      = Season(number: 1, dateRelease: "2011-04-17", dateFinish: "2011-06-19")
            let season2      = Season(number: 2, dateRelease: "2012-04-01", dateFinish: "2012-06-03")
            let season3      = Season(number: 3, dateRelease: "2013-03-31", dateFinish: "2013-06-09")
            let season4      = Season(number: 4, dateRelease: "2014-04-06", dateFinish: "2014-06-15")
            let season5      = Season(number: 5, dateRelease: "2015-04-12", dateFinish: "2015-06-14")
            let season6      = Season(number: 6, dateRelease: "2016-04-24", dateFinish: "2016-06-26")
            let season7      = Season(number: 7, dateRelease: "2017-07-16", dateFinish: "2017-08-27")
            
            var arrayEpisodes = [Episode]()
            
            arrayEpisodes.append(Episode(numberOvervall: 01, numberInSeason: 01, title: "Winter Is Coming", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 02, numberInSeason: 02, title: "The Kingsroad", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 03, numberInSeason: 03, title: "Lord Snow", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 04, numberInSeason: 04, title: "Cripples, Bastards, and Broken Things", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 05, numberInSeason: 05, title: "The Wolf and the Lion", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 06, numberInSeason: 06, title: "A Golden Crown", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 07, numberInSeason: 07, title: "You Win or You Die", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 08, numberInSeason: 08, title: "The Pointy End", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 09, numberInSeason: 09, title: "Baelor", season: season1))
            arrayEpisodes.append(Episode(numberOvervall: 10, numberInSeason: 10, title: "Fire and Blood", season: season1))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season1.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(numberOvervall: 11, numberInSeason: 01, title: "The North Remembers", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 12, numberInSeason: 02, title: "The Night Lands", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 13, numberInSeason: 03, title: "What Is Dead May Never Die", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 14, numberInSeason: 04, title: "Garden of Bones", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 15, numberInSeason: 05, title: "The Ghost of Harrenhal", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 16, numberInSeason: 06, title: "The Old Gods and the New", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 17, numberInSeason: 07, title: "A Man Without Honor", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 18, numberInSeason: 08, title: "The Prince of Winterfell", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 19, numberInSeason: 09, title: "Blackwater", season: season2))
            arrayEpisodes.append(Episode(numberOvervall: 20, numberInSeason: 10, title: "Valar Morghulis", season: season2))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season2.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(numberOvervall: 21, numberInSeason: 01, title: "Valar Dohaeris", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 22, numberInSeason: 02, title: "Dark Wings, Dark Words", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 23, numberInSeason: 03, title: "Walk of Punishment", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 24, numberInSeason: 04, title: "And Now His Watch Is Ended", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 25, numberInSeason: 05, title: "Kissed by Fire", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 26, numberInSeason: 06, title: "The Climb", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 27, numberInSeason: 07, title: "The Bear and the Maiden Fair", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 28, numberInSeason: 08, title: "Second Sons", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 29, numberInSeason: 09, title: "The Rains of Castamere", season: season3))
            arrayEpisodes.append(Episode(numberOvervall: 30, numberInSeason: 10, title: "Mhysa", season: season3))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season3.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(numberOvervall: 31, numberInSeason: 01, title: "Two Swords", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 32, numberInSeason: 02, title: "The Lion and the Rose", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 33, numberInSeason: 03, title: "Breaker of Chains", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 34, numberInSeason: 04, title: "Oathkeeper", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 35, numberInSeason: 05, title: "First of His Name", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 36, numberInSeason: 06, title: "The Laws of Gods and Men", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 37, numberInSeason: 07, title: "Mockingbird", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 38, numberInSeason: 08, title: "The Mountain and the Viper", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 39, numberInSeason: 09, title: "The Watchers on the Wall", season: season4))
            arrayEpisodes.append(Episode(numberOvervall: 40, numberInSeason: 10, title: "The Children", season: season4))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season4.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(numberOvervall: 41, numberInSeason: 01, title: "The Wars to Come", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 42, numberInSeason: 02, title: "The House of Black and White", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 43, numberInSeason: 03, title: "High Sparrow", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 44, numberInSeason: 04, title: "Sons of the Harpy", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 45, numberInSeason: 05, title: "Kill the Boy", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 46, numberInSeason: 06, title: "Unbowed, Unbent, Unbroken", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 47, numberInSeason: 07, title: "The Gift", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 48, numberInSeason: 08, title: "Hardhome", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 49, numberInSeason: 09, title: "The Dance of Dragons", season: season5))
            arrayEpisodes.append(Episode(numberOvervall: 50, numberInSeason: 10, title: "Mother's Mercy", season: season5))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season5.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes.append(Episode(numberOvervall: 51, numberInSeason: 01, title: "The Red Woman", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 52, numberInSeason: 02, title: "Home", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 53, numberInSeason: 03, title: "Oathbreaker", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 54, numberInSeason: 04, title: "Book of the Stranger", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 55, numberInSeason: 05, title: "The Door", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 56, numberInSeason: 06, title: "Blood of My Blood", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 57, numberInSeason: 07, title: "The Broken Man", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 58, numberInSeason: 08, title: "No One", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 59, numberInSeason: 09, title: "Battle of the Bastards", season: season6))
            arrayEpisodes.append(Episode(numberOvervall: 60, numberInSeason: 10, title: "The Winds of Winter", season: season6))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season6.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(numberOvervall: 61, numberInSeason: 01, title: "Dragonstone", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 62, numberInSeason: 02, title: "Stormborn", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 63, numberInSeason: 03, title: "The Queen's Justice", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 64, numberInSeason: 04, title: "TBA", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 65, numberInSeason: 05, title: "TBA", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 66, numberInSeason: 06, title: "TBA", season: season7))
            arrayEpisodes.append(Episode(numberOvervall: 67, numberInSeason: 07, title: "TBA", season: season7))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season7.add(episodesArray: arrayEpisodes)
            
            
            return [season2, season4, season6, season1, season3, season5, season7].sorted()
            
        }
    }
    
    func season(numered: Int) -> Season? {
        let season = seasons.filter{$0.number == numered}.first
        return season
        
    }
    
    func season(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = RepositorySeasons.local.seasons.filter(filteredBy)
        return filtered
    }
}
