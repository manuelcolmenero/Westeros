//
//  RepositoryTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 11/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    // Se obtiene del repositorio la propiedad "houses"
    var houses = [House!]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Se obtiene del repositorio la propiedad "houses"
        houses = Repository.local.houses
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Se crea un test para un repositorio local
    func testLocalRepositoryCreation() {
        // Se verifica una estructura con una propiedad "local" que es el repositorio
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHouseCreation() {

        
        // Se verifica que se han obtenido datos
        XCTAssertNotNil(houses)
        
        // Se verifica el número de registros que se han recibido
        XCTAssertEqual(houses.count, 6)
    }
    
    func testLocalRepositorySorted() {
        let houses = Repository.local.houses
        
        XCTAssertNotEqual(houses, houses.reversed())
        
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalRepositoryFilter() {
        func filterStark(house: House) -> Bool {
            let starkHouse : House? = Repository.local.house(named: "Stark")
            return house == starkHouse
        }
        
        func filterFail(house: House) -> Bool {
            let failHouse = House(name: "Fail",
                                     sigil: (Repository.local.house(named: "Tyrell")?.sigil)!,
                                     words: "No words")
            return house == failHouse
        }
        
        var result : [House]? = Repository.local.houses(filter: filterStark)
        XCTAssertNotEqual(result!, [])
        
        result = Repository.local.houses(filter: filterFail)
        XCTAssertEqual(result!, [])
    }
    
    // Se crea un test para un repositorio remoto
    
}
