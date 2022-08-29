//
//  CalculatorTests.swift
//  QuestionnaireTests
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import XCTest
@testable import Questionnaire

class CalculatorTests: XCTestCase {
    func testCalculateScore() throws {
        var inputEntry = QuestionEntry(array: ["Question 1?", "wrongAnswer", "*correctAnswer"])
        inputEntry.selectedAnswer = 1
        let calculatedResult = Calculator(questionEntries: [inputEntry]).calculateScore()
        
        XCTAssertTrue(calculatedResult == 1)
    }
    
    func testReport() throws {
        var inputEntry1 = QuestionEntry(array: ["Question 1?", "wrongAnswer", "*correctAnswer"])
        inputEntry1.selectedAnswer = 0
        var inputEntry2 = QuestionEntry(array: ["Question 2?", "nextWrongAnswer", "*nextCorrectAnswer"])
        inputEntry2.selectedAnswer = 1
    
        let entries = [inputEntry1, inputEntry2]
        let calculatedResult = Calculator(questionEntries: entries).report
        
        let result1 = ResultText(question: "Question 1?", selectedAnswer: "wrongAnswer", correctAnswer: "correctAnswer", isCorrect: false)
        let result2 = ResultText(question: "Question 2?", selectedAnswer: "nextCorrectAnswer", correctAnswer: "nextCorrectAnswer", isCorrect: true)
        let expectedResult = Report(numberOfCorrectAnswers: 1, numberOfQuestions: 2, correctPercentages: 50.0, resultText: [result1, result2])
        
        XCTAssertTrue(calculatedResult == expectedResult)
    }
    
    func testCalculateResult() throws {
        var input = QuestionEntry(array: ["Question 1?", "wrongAnswer", "*correctAnswer"])
        input.selectedAnswer = 0
        let calculatedResult = Calculator(questionEntries: [input]).calculateResult(entry: input)
        
        XCTAssertTrue(calculatedResult.isCorrect == false &&
                      calculatedResult.selectedAnswer == "wrongAnswer" &&
                      calculatedResult.correctAnswer == "correctAnswer")
    }
    
    func testIsWrongAnswer() throws {
        var input = QuestionEntry(array: ["Question 1?", "wrongAnswer", "*correctAnswer"])
        input.selectedAnswer = 0
        let calculatedResult = Calculator(questionEntries: [input]).isCorrectAnswer(entry: input)
        XCTAssertFalse(calculatedResult)
    }
    
    func testIsCorrectAnswer() throws {
        var input = QuestionEntry(array: ["Question 1?", "wrongAnswer", "*correctAnswer"])
        input.selectedAnswer = 1
        let calculatedResult = Calculator(questionEntries: [input]).isCorrectAnswer(entry: input)
        
        XCTAssertTrue(calculatedResult)
    }
}
