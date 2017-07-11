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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        // Se obtiene del repositorio la propiedad "houses"
        let houses = Repository.local.houses
        
        // Se verifica que se han obtenido datos
        XCTAssertNotNil(houses)
        
        // Se verifica el número de registros que se han recibido
        XCTAssertEqual(houses.count, 3)
    }
    
    // Se crea un test para un repositorio remoto
    
}
