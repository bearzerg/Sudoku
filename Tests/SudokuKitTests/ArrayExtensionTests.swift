//
//  File.swift
//  
//
//  Created by Eneko Alonso on 12/22/19.
//

import XCTest
import SudokuKit

final class ArrayExtensionsTests: XCTestCase {

    func testPartitions() {
        let numbers = Array(1...10)
        let partitions = numbers.split(inGroupsOf: 3)
        XCTAssertEqual(partitions.count, 4)
        XCTAssertEqual(partitions[0], [1,2,3])
        XCTAssertEqual(partitions[1], [4,5,6])
        XCTAssertEqual(partitions[2], [7,8,9])
        XCTAssertEqual(partitions[3], [10])
    }

    func testTranspose1x1() {
        var numbers = [1]
        numbers.transpose()
        XCTAssertEqual(numbers, [1])
    }

    func testTranspose2x2() {
        var numbers = [1, 2, 3, 4]
        numbers.transpose()
        XCTAssertEqual(numbers, [1, 3, 2, 4])
    }

    func testTranspose3x3() {
        var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        numbers.transpose()
        XCTAssertEqual(numbers, [1, 4, 7, 2, 5, 8, 3, 6, 9])
    }

    func testTranspose4x4() {
        let numbers = [
            1,  2,  3,  4,
            5,  6,  7,  8,
            9, 10, 11, 12,
           13, 14, 15, 16
        ]
        let transposed = [
            1,  5,  9, 13,
            2,  6, 10, 14,
            3,  7, 11, 15,
            4,  8, 12, 16
        ]
        XCTAssertEqual(numbers.transposed(), transposed)
    }

    func testTranspose5x5() {
        let numbers = [
            1,  2,  3,  4,  5,
            6,  7,  8,  9, 10,
           11, 12, 13, 14, 15,
           16, 17, 18, 19, 20,
           21, 22, 23, 24, 25
        ]
        let transposed = [
            1,  6, 11, 16, 21,
            2,  7, 12, 17, 22,
            3,  8, 13, 18, 23,
            4,  9, 14, 19, 24,
            5, 10, 15, 20, 25
        ]
        XCTAssertEqual(numbers.transposed(), transposed)
    }

}