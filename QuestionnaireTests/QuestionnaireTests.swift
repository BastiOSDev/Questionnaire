//
//  QuestionnaireTests.swift
//  QuestionnaireTests
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import XCTest
@testable import Questionnaire

class QuestionnaireTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReader() throws {
        let testData = Bundle(for: type(of: self)).url(forResource: "ReaderTestFile", withExtension: "txt")
        let calculatedResult = FileReader().readQuestionFile(file: testData!)
        let expectedResult = ["Row 1", "Row 2"]
        
        XCTAssertTrue(calculatedResult == expectedResult, "Wrong file parsing")
    }
    
    func testSelection() throws {
        let input = ["Question 1?", "Answer 1", "*Answer 2"]
        
        let inputEntry = QuestionEntry(array: input)
        let testData = [inputEntry]
        let calculatedResult = ContentView(content: testData).selectContent(answer: "Answer 2", fromEntry: inputEntry)
        
        var expectedResult = QuestionEntry(array: ["Question 1?", "Answer 1", "*Answer 2"])
        expectedResult.correctAnswer = 1
        expectedResult.selectedAnswer = 1
        
        XCTAssertTrue(calculatedResult == expectedResult, "Wrong selection")
    }
    
    // TO DO: UITest for testSelection (ViewController)
}
