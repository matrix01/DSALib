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

    func testQuickSortingSingleEelement() throws {
        let result = sut.quickSort(elements: [1])

        XCTAssertEqual([1], result)
    }
    
    func testQuickSort() throws {
        let result = sut.quickSort(elements: [193, 8, 849, 92, 29, 222, 555, 938])
        
        XCTAssertEqual([8, 29, 92, 193, 222, 555, 849, 938], result)
    }
    
    func testMergeSort() throws {
        let elements = [193, 8, 849, 92, 29, 222, 555, 938]
        let sorted = sut.mergeSort(list: elements)
        
        XCTAssertEqual([8, 29, 92, 193, 222, 555, 849, 938], sorted)
    }
    
    func testMergeSortingSingleEelement() throws {
        let result = sut.mergeSort(list: [1])

        XCTAssertEqual([1], result)
    }
    
    func testInPlaceQuickSortingSingleEelement() throws {
        var elements = [193]
        sut.quickSortInPlace(arr: &elements, low: 0, high: elements.count - 1)

        XCTAssertEqual([193], elements)
    }
    
    func testQuickSortInPlace() throws {
        var elements = [193, 8, 849, 92, 29, 222, 555, 938]
        sut.quickSortInPlace(arr: &elements, low: 0, high: elements.count - 1)
        
        XCTAssertEqual([8, 29, 92, 193, 222, 555, 849, 938], elements)
    }
    
    func testEmptyArraySorting() throws {
        /// QuickSort
        let result = sut.quickSort(elements: [])
        XCTAssertEqual([], result)
        
        /// quickSortInPlace
        var elements = [Int]()
        sut.quickSortInPlace(arr: &elements, low: 0, high: 0)
        XCTAssertEqual([], elements)
        
        /// Merge sort
        let sorted = sut.mergeSort(list: [])
        XCTAssertEqual([], sorted)
    }

    static var allTests = [
        ("testQuickSortingSingleEelement", testQuickSortingSingleEelement),
        ("testQuickSort", testQuickSort)
    ]
}
