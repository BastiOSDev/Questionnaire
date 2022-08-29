//
//  ParserTests.swift
//  QuestionnaireTests
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import XCTest
@testable import Questionnaire

class ParserTests: XCTestCase {
    func testParserGetQuestionEntries() throws {
        let inputData = ["?First question", "wrongAnswer", "*correctAnswer", "?Second question", "*correctAnswer", "wrongAnswer"]
        let calculatedResult = DocumentParser.getQuestionEntries(inputData)
        
        let result1 = QuestionEntry(array: ["?First question", "wrongAnswer", "*correctAnswer"])
        let result2 = QuestionEntry(array: ["?Second question", "*correctAnswer", "wrongAnswer"])
        
        let expectedResult = [result1, result2]
        
        XCTAssertTrue(calculatedResult == expectedResult, "Wrong question parsing")
    }
}
