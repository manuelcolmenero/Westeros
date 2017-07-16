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

    // Se crea un test para verificar el sistema de ordenación
    func testLocalRepositorySorted() {
        let houses = Repository.local.houses
        
        // Se comprueba que lo devuelto por houses no es igual a la inversa de houses
        XCTAssertNotEqual(houses, houses.reversed())
        
        // Se verifica que houses y la ordenación de houses coinciden
        XCTAssertEqual(houses, houses.sorted())
    }
    
    // Se crea un test para verificar el sistema de filtros
    func testLocalRepositoryFilter() {
        
        
        // Se crea una fulción que devuelve un objeto House para filtra por la casa Stark
        func filterStark(house: House) -> Bool {
            let starkHouse : House? = Repository.local.house(named: "Stark")
            return house == starkHouse
        }
        
        // Se crea una función que devuelve un objeto House que no existe en el repository
        func filterFail(house: House) -> Bool {
            let failHouse = House(name: "Fail",
                                     sigil: (Repository.local.house(named: "Tyrell")?.sigil)!,
                                     words: "No words")
            return house == failHouse
        }
        
        // result recibe como formato [House]?
        var result  = Repository.local.houses(filter: filterStark)
        
        // Se verifica que el filtro no ha devuelto vacio
        XCTAssertNotEqual(result!, [])
        
        // Se verifica que el filtro devuelto es igual a recuperar el mismo dato directamente
        let starkHouseForComparation      = Repository.local.house(named: "Stark")
        XCTAssertEqual(result![0], starkHouseForComparation)
        
        // Se verifica que el filtro ha devuelto vacio
        result = Repository.local.houses(filter: filterFail)
        XCTAssertEqual(result!, [])
        
        
    }
    
    // Se crea un test para un repositorio remoto
    
}
