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
        let calculatedResult = DocumentParser().getQuestionEntries(inputData)
        
        let result1 = QuestionEntry(question: "First question?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: nil)
        let result2 = QuestionEntry(question: "Second question?", answers: ["correctAnswer", "wrongAnswer"], correctAnswer: 0, selectedAnswer: nil)
        let expectedResult = [result1, result2]
        
        XCTAssertTrue(calculatedResult == expectedResult, "Wrong question parsing")
    }
    
    func testParserQuestionEntry() throws {
        let inputData = ["?This is the question", "wrongAnswer", "*correctAnswer"]
        let calculatedResult = DocumentParser().getQuestionEntry(inputData)
        let expectedResult = QuestionEntry(question: "This is the question?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: nil)
        
        XCTAssertTrue(calculatedResult == expectedResult, "Wrong calculation of questionEntry")
    }
}
