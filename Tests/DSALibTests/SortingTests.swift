//
//  SortingTests.swift
//  
//
//  Created by Milan on 2024/05/11.
//

import XCTest
@testable import DSALib

final class SortingTests: XCTestCase {
    let sut = Sorting()

    func testSortingSingleEelement() throws {
        let result = sut.quickSort(elements: [1])

        XCTAssertEqual([1], result)
    }

    static var allTests = [
        ("testSortingSingleEelement", testSortingSingleEelement)
    ]
}
