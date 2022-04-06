//
//  BankKodemiaTests.swift
//  BankKodemiaTests
//
//  Created by Mario Saldana on 06/04/22.
//

import XCTest

class BankKodemiaTests: XCTestCase {

    override func setUpWithError() throws {
        // Esta funcion siempre se va a llamar antes de cada test case que se va a evaluar
        print("setting up")
    }

    override func tearDownWithError() throws {
        // se manda llamar despues de cada test case que se evalue
    }
    
    /**
     orden de invocacion
     ->setUpWithError()
     ->testExample()
     ->tearDownWithError()
     
     ->setUpWithError()
     ->anotherTestExample()
     ->tearDownWithError()
     
     */

    func testExample() throws {
        print("test example")
        let a: Int = 1
        let b: Int = 4
        let c: Int = 1
        XCTAssert(a == c)
    }

    func testPerformanceExample() throws {
        print("testPerformance example")
    }
}
