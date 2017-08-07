//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    // Seasons
    var season1     : Season!
    var season2     : Season!
    
    var episode1x01 : Episode!
    var episode1x02 : Episode!
    var episode1x03 : Episode!
    
    var episode2x01 : Episode!
    var episode2x02 : Episode!
    var episode2x03 : Episode!
    
    
    // Houses
    var starkHouse      : House!
    var lannisterHouse  : House!
    var mormontHouse    : House!
    var targaryenHouse  : House!
    var greyjoyHouse    : House!
    var tyrellHouse     : House!
    
    var robb            : Person!
    var arya            : Person!
    var tyrion          : Person!
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse      = Repository.local.house(named: "Stark")
        lannisterHouse  = Repository.local.house(named: "Lannister")
        
        robb    = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya    = Person(name: "Arya", house: starkHouse)
        tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        season1      = Season(name: "Season 1",
                              dateRelease: "2011-04-17",
                              dateFinish: "2011-06-19",
                              synopsis: "Season 1 spans a period of several months on a world where the seasons last for years at a time. The action begins in the unified Seven Kingdoms of Westeros as the long summer ends and winter draws near. Lord Eddard Stark is asked by his old friend, King Robert Baratheon, to serve as the Hand of the King following the death of the previous incumbent, Eddard's mentor Jon Arryn. Eddard is reluctant, but receives intelligence suggesting that Jon was murdered. Eddard accepts Robert's offer, planning to use his position and authority to investigate the alleged murder.")
        
        episode1x01  = Episode(name: "Episode 1",
                               dateRelease: "2011-04-17",
                               numberOvervall: 01,
                               numberInSeason: 01,
                               title: "Winter Is Coming",
                               season: season1,
                               synopsis: "In the Seven Kingdoms of Westeros, a soldier survives an attack by the supernatural creatures known as the White Walkers. He rushes to Castle Winterfell, which is ruled by Eddard, who decapitates him for deserting his post. In King's Landing, the capital, Jon Arryn, the \"Hand of the King\", dies under mysterious circumstances.")
        episode1x02  = Episode(name: "Episode 2",
                               dateRelease: "2011-04-24",
                               numberOvervall: 02,
                               numberInSeason: 02,
                               title: "The Kingsroad",
                               season: season1,
                               synopsis: "Having accepted his new role as the Hand of the King, Eddard leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Eddard about the attempt and suspected Lannister involvement.")
        
        episode1x01.add(persons: robb, arya, tyrion)
        episode1x02.add(persons: robb, arya, tyrion)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1x01)
    }
    
    // Test de igualdad
    func testEpisodeEquality() {
        // Identidad
        XCTAssertEqual(episode1x01, episode1x01)
        
        // Igualdad
        let episode1x01bis  = Episode(name: "Episode 1",
                                      dateRelease: "2011-04-17",
                                      numberOvervall: 01,
                                      numberInSeason: 01,
                                      title: "Winter Is Coming",
                                      season: season1,
                                      synopsis: "In the Seven Kingdoms of Westeros, a soldier survives an attack by the supernatural creatures known as the White Walkers. He rushes to Castle Winterfell, which is ruled by Eddard, who decapitates him for deserting his post. In King's Landing, the capital, Jon Arryn, the \"Hand of the King\", dies under mysterious circumstances.")
        
        XCTAssertEqual(episode1x01bis, episode1x01)
        
        // Desigualdad
        XCTAssertNotEqual(episode1x01, episode1x02)
        
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(episode1x01.hashValue)
    }
    
    
    func testEpisodeComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(episode1x01, episode1x02)
    }

    func testCustomStringConvertible() {
        XCTAssertEqual(episode1x01.description, "Episode 1")
    }
}
