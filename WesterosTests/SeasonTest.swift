//
//  SeasonTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    // Seasons
    var season1     : Season!
    var season2     : Season!
    
    var episode1x01 : Episode!
    var episode1x02 : Episode!
    var episode1x03 : Episode!

    var episode2x01 : Episode!
    var episode2x02 : Episode!
    var episode2x03 : Episode!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

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
        episode1x03  = Episode(name: "Episode 3",
                               dateRelease: "2011-05-01",
                               numberOvervall: 03,
                               numberInSeason: 03,
                               title: "Lord Snow",
                               season: season1,
                               synopsis: "Ned joins the King's Small Council at King's Landing, capital of the Seven Kingdoms, and learns just how poorly Westeros is being managed. Catelyn tries to covertly warn her husband, but is intercepted by an old friend, Councillor Petyr \"Littlefinger\" Baelish.")
        
        season2      = Season(name: "Season 2",
                              dateRelease: "2012-04-01",
                              dateFinish: "2012-06-03",
                              synopsis: "Season 2 spans several months on a world where the seasons last for years at a time. The Seven Kingdoms are at war, with the King in the North, Robb Stark, fighting to win independence for his people and those of the Riverlands. Robb decides that he must win the allegiance of the fiercely independent ironborn to his cause, and sends his best friend Theon Greyjoy to treat with his father, who is hatching plans of his own. Meanwhile, Joffrey Baratheon holds the Iron Throne with the backing of the powerful House Lannister, but his uncle Renly has also claimed the throne with the support of House Tyrell, whose armies are much larger. As they struggle for the throne, Tyrion Lannister arrives in King's Landing to take matters in hand, only to face opposition from his scheming sister, Cersei, now the Queen Regent.")
        
        
        episode2x01  = Episode(name: "Episode 1",
                               dateRelease: "2011-04-17",
                               numberOvervall: 01,
                               numberInSeason: 01,
                               title: "Winter Is Coming",
                               season: season1,
                               synopsis: "In the Seven Kingdoms of Westeros, a soldier survives an attack by the supernatural creatures known as the White Walkers. He rushes to Castle Winterfell, which is ruled by Eddard, who decapitates him for deserting his post. In King's Landing, the capital, Jon Arryn, the \"Hand of the King\", dies under mysterious circumstances.")
        episode2x02  = Episode(name: "Episode 2",
                               dateRelease: "2011-04-24",
                               numberOvervall: 02,
                               numberInSeason: 02,
                               title: "The Kingsroad",
                               season: season1,
                               synopsis: "Having accepted his new role as the Hand of the King, Eddard leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Eddard about the attempt and suspected Lannister involvement.")
        episode2x03  = Episode(name: "Episode 3",
                               dateRelease: "2011-05-01",
                               numberOvervall: 03,
                               numberInSeason: 03,
                               title: "Lord Snow",
                               season: season1,
                               synopsis: "Ned joins the King's Small Council at King's Landing, capital of the Seven Kingdoms, and learns just how poorly Westeros is being managed. Catelyn tries to covertly warn her husband, but is intercepted by an old friend, Councillor Petyr \"Littlefinger\" Baelish.")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Caso de test para comprobar que "Season" existe y es usable
    func testSeasonExistence() {
        // Se comprueba que no sea nil
        XCTAssertNotNil(season1)
        
    }
    
    // Caso de test para añadir "Episodes" a "Seasons"
    func testAddEpisodes(){
        // Se verifica cuantos Episodes hay en Season1
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episodes: episode1x01)
        XCTAssertEqual(season1.count, 1)
    }
    
    func testEquality() {
        // Identidad
        XCTAssertEqual(season1, season1)
        
        // Igualdad
        let jinxed = season1
        
        XCTAssertEqual(jinxed, season1)
        
        // Desigualdad
        XCTAssertNotEqual(season1, season2)
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testHouseComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(season1, season2)
    }
    
    func testCustomStringConvertible() {
        XCTAssertEqual(season1.description, "Season 1")
    }
}
