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
        let inputEntry1 = QuestionEntry(question: "Question 1?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: 0)
        let inputEntry2 = QuestionEntry(question: "Question 2?", answers: ["nextWrongAnswer", "nextCorrectAnswer"], correctAnswer: 1, selectedAnswer: 1)
        let entries = [inputEntry1, inputEntry2]
        let calculatedResult = Calculator(questionEntries: entries).calculateScore()
        
        let expectedResult = 1
        
        XCTAssertTrue(calculatedResult == expectedResult)
    }
    
    func testReport() throws {
        let inputEntry1 = QuestionEntry(question: "Question 1?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: 0)
        let inputEntry2 = QuestionEntry(question: "Question 2?", answers: ["nextWrongAnswer", "nextCorrectAnswer"], correctAnswer: 1, selectedAnswer: 1)
        let entries = [inputEntry1, inputEntry2]
        let calculatedResult = Calculator(questionEntries: entries).getReport()
        
        let result1 = ResultText(question: "Question 1?", selectedAnswer: "wrongAnswer", isCorrect: false)
        let result2 = ResultText(question: "Question 2?", selectedAnswer: "nextCorrectAnswer", isCorrect: true)
        let expectedResult = Report(numberOfCorrectAnswers: 1, numberOfQuestions: 2, resultText: [result1, result2])
        
        XCTAssertTrue(calculatedResult == expectedResult)
    }
    
    func testCalculateResult() throws {
        let input = QuestionEntry(question: "Question 1?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: 0)
        let calculatedResult = Calculator(questionEntries: [input]).calculateResult(entry: input)
        let expectedResult = ResultText(question: "Question 1?", selectedAnswer: "wrongAnswer", isCorrect: false)
        
        XCTAssertTrue(calculatedResult == expectedResult)
    }
    
    func testIsWrongAnswer() throws {
        let input = QuestionEntry(question: "Question 1?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: 0)
        let calculatedResult = Calculator(questionEntries: [input]).isCorrectAnswer(entry: input)
        
        XCTAssertFalse(calculatedResult)
    }
    
    func testIsCorrectAnswer() throws {
        let input = QuestionEntry(question: "Question 1?", answers: ["wrongAnswer", "correctAnswer"], correctAnswer: 1, selectedAnswer: 1)
        let calculatedResult = Calculator(questionEntries: [input]).isCorrectAnswer(entry: input)
        
        XCTAssertTrue(calculatedResult)
    }
}
