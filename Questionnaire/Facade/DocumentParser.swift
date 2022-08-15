//
//  DocumentParser.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import Foundation

class DocumentParser {
    func getQuestions(_ strings: [String]) -> [QuestionEntry] {
        let result = QuestionEntry(question: "", answers: [""], correctAnswer: 0, selectedAnswer: nil)
        return [result]
    }
    
    func getQuestionEntry(_ strings: [String]) -> QuestionEntry {
        let result = QuestionEntry(question: "", answers: [""], correctAnswer: 0, selectedAnswer: nil)
        return result
    }
    
    private func findQuestion() {
        
    }
}
