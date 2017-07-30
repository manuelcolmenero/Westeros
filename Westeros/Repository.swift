//
//  Repository.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 11/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit


// Clase con propiedad estatica
final class Repository {
    
    static let local = LocalFactory()
}

// Mark: - HouseFactory

// Protocolo de crear casas independiente del canal
protocol HouseFactory {
    
    // Se crea un typealias de función (clausura) que recibe un modelo y devuelve un Bool
    typealias FilterHouse  = (House)  -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses  : [House]  {get}
    var seasons : [Season] {get}
    
    // Función que devuelve un modelo a partir de su nombre
    func house(named : String)  -> House?
    func season(named : String) -> Season?
    
    // Función que trata de obtener modelos filtrados por algun criterio.
    func houses(filteredBy: FilterHouse)  -> [House]
    func seasons(filteredBy: FilterSeason) -> [Season]
}

// Mark: - LocalFactory
// Función para crear modo local casas
final class LocalFactory : HouseFactory {
    
    // MARK: - Houses Repository
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
            let reedURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Reed")!
            let gloverURL       = URL(string: "https://awoiaf.westeros.org/index.php/House_Glover")!
            let tullyURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!
            let tarlyURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Tarly")!
            
            
            // Sigils
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "starkSigil.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannisterSigil.png"), description: "Rampant lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormontSigil.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose on a green field")
            let reedSigil = Sigil(image: #imageLiteral(resourceName: "reedSigil.png"), description: "A black lizard-lion on grey-green")
            let gloverSigil = Sigil(image: #imageLiteral(resourceName: "gloverSigil.png"), description: "A silver fist on scarlet")
            let tullySigil = Sigil(image: #imageLiteral(resourceName: "tullySigil.png"), description: "A leaping silver trout on a field of blue and mud red")
            let tarlySigil = Sigil(image: #imageLiteral(resourceName: "tarlySigil.png"), description: "Vert, a huntsman striding to dexter proper garbed gules")
            
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
            let reed        = House(name: "Reed",
                                    sigil: reedSigil,
                                    words: "Hearth, heart and harvest",
                                    url: reedURL)
            // House Glover
            let glover      = House(name: "Glover",
                                  sigil: gloverSigil,
                                  words: "Sworn to stark",
                                  url: gloverURL)
            // House Tully
            let tully       = House(name: "Tully",
                                    sigil: tullySigil,
                                    words: "Family, Duty, Honor",
                                    url: tullyURL)
            
            // ---- Tyrell ----
            // House Tarly
            let tarly       = House(name: "Tarly",
                                    sigil: tarlySigil,
                                    words: "First in Battle",
                                    url: tarlyURL)
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
            stark.addMinorHouse(houses: glover)
            stark.addMinorHouse(houses: tully)
            stark.addMinorHouse(houses: reed)
            
            // ---- Tyrell ----
            tyrell.addMinorHouse(houses: tarly)
            
            return [stark, lannister, mormont, tyrell, greyjoy, targaryen, glover, tully, reed, tarly].sorted()
        }
    }
    
    // MARK: - Seasons Repository
    
    var seasons: [Season]{
        get{
            // Se recuperan las personas
            // Characters
            
            var arrayPersons = [Person]()
            let houses = self.houses
            
            for house in houses {
                for person in house.sortedMembers() {
                    arrayPersons.append(person)
                }
            }
            
            // Aquí es donde se crean las temporadas
            let season1      = Season(name: "Season 1",
                                      dateRelease: "2011-04-17",
                                      dateFinish: "2011-06-19",
                                      synopsis: "Season 1 spans a period of several months on a world where the seasons last for years at a time. The action begins in the unified Seven Kingdoms of Westeros as the long summer ends and winter draws near. Lord Eddard Stark is asked by his old friend, King Robert Baratheon, to serve as the Hand of the King following the death of the previous incumbent, Eddard's mentor Jon Arryn. Eddard is reluctant, but receives intelligence suggesting that Jon was murdered. Eddard accepts Robert's offer, planning to use his position and authority to investigate the alleged murder.")
            let season2      = Season(name: "Season 2",
                                      dateRelease: "2012-04-01",
                                      dateFinish: "2012-06-03",
                                      synopsis: "Season 2 spans several months on a world where the seasons last for years at a time. The Seven Kingdoms are at war, with the King in the North, Robb Stark, fighting to win independence for his people and those of the Riverlands. Robb decides that he must win the allegiance of the fiercely independent ironborn to his cause, and sends his best friend Theon Greyjoy to treat with his father, who is hatching plans of his own. Meanwhile, Joffrey Baratheon holds the Iron Throne with the backing of the powerful House Lannister, but his uncle Renly has also claimed the throne with the support of House Tyrell, whose armies are much larger. As they struggle for the throne, Tyrion Lannister arrives in King's Landing to take matters in hand, only to face opposition from his scheming sister, Cersei, now the Queen Regent.")
            let season3      = Season(name: "Season 3",
                                      dateRelease: "2013-03-31",
                                      dateFinish: "2013-06-09",
                                      synopsis: "Season 3 spans several months on a world where the seasons can last for years at a time. Autumn has fallen across the world, with winter not far behind. The people should be preparing for years of snow and ice, but the Seven Kingdoms of Westeros instead remain gripped by civil war. Would-be king Renly Baratheon has been assassinated, altering the alliances in the war. The cruel boy-king Joffrey Baratheon has won a great victory by securing an alliance with House Tyrell, with his supporters defeating his uncle Stannis in an epic battle. Joffrey now commands the largest armies in the realm and his triumph appears inevitable.")
            let season4      = Season(name: "Season 4",
                                      dateRelease: "2014-04-06",
                                      dateFinish: "2014-06-15",
                                      synopsis: "The War of the Five Kings is drawing to a close, but new intrigues and plots are in motion, and the surviving factions must contend with enemies not only outside their ranks, but within.")
            let season5      = Season(name: "Season 5",
                                      dateRelease: "2015-04-12",
                                      dateFinish: "2015-06-14",
                                      synopsis: "The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.")
            let season6      = Season(name: "Season 6",
                                      dateRelease: "2016-04-24",
                                      dateFinish: "2016-06-26",
                                      synopsis: "Westeros braces for a winter which may become a new Long Night, as the White Walkers and their army of the dead are poised to strike against the Wall and the realms of men.")
            let season7      = Season(name: "Season 7",
                                      dateRelease: "2017-07-16",
                                      dateFinish: "2017-08-27",
                                      synopsis: "After a summer lasting almost ten years, the words of House Stark have finally become reality once again: winter is here.")
            
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

    
    // MARK: - Funtions - Houses

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
    func houses(filteredBy: FilterHouse) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    // MARK: - Funtions - Seasons
    func season(named: String) -> Season? {
        let season = seasons.filter{$0.name == named}.first
        return season
        
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
}
