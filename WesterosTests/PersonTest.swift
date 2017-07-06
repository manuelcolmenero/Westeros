//
//  CharacterTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    // "!" significa que puede contener algo o nil
    // Se declara fuera de setUp para que sea variable global
    var starkHouse : House!
    var starkSigil : Sigil!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        let ned = Person(name : "Eddard", alias : "Ned", house: starkHouse)
        XCTAssertNotNil(ned)
    }
}
