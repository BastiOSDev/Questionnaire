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
    
    func testParser() throws {
        let parserTests = ParserTests()
        
        try parserTests.testParserQuestionEntry()
        try parserTests.testParserGetQuestion()
    }
    
    func testCalculator() throws {
        let calculatorTests = CalculatorTests()
        
        try calculatorTests.testCalculateScore()
        try calculatorTests.testReport()
    }
    
    // TO DO: UITest for testSelection (ViewController)
}
