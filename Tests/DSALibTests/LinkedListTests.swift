//
//  LinkedListTests.swift
//  
//
//  Created by Milan on 2024/05/11.
//

import XCTest
@testable import DSALib

final class LinkedListTests: XCTestCase {
    var sut: LinkedList!
    
    override func setUp() {
        super.setUp()
        sut = LinkedList()
    }
    
    func testInsertIntoLinkedList() throws {
        sut.insert(data: 10)
        sut.insert(data: 25)
        sut.insert(data: 30)
        
        XCTAssertNotNil(sut.head)
        XCTAssertEqual(sut.head?.data, 10)
    }
    
    func testFirstDelete() throws {
        sut.insert(data: 10)
        sut.insert(data: 25)
        
        sut.delete(data: 10)
        XCTAssertNotNil(sut.head)
        XCTAssertEqual(sut.head?.data, 25)
    }
    
    func testDeleteOtherItems() throws {
        sut.insert(data: 10)
        sut.insert(data: 25)
        
        sut.delete(data: 25)
        XCTAssertNotNil(sut.head)
        XCTAssertNil(sut.head?.next)
    }
    
    func testDeleteSecondItems() throws {
        sut.insert(data: 10)
        sut.insert(data: 20)
        sut.insert(data: 30)
        
        sut.delete(data: 20)
        XCTAssertEqual(sut.head?.data, 10)
        XCTAssertEqual(sut.head?.next?.data, 30)
    }
    
    func testDeleteManyItems() throws {
        sut.insert(data: 10)
        sut.insert(data: 25)
        sut.insert(data: 30)
        sut.insert(data: 50)
        sut.insert(data: 100)
        
        sut.delete(data: 25)
        sut.delete(data: 100)
        sut.delete(data: 10)
        
        XCTAssertEqual(sut.head?.data, 30)
        XCTAssertEqual(sut.head?.next?.data, 50)
    }
}
