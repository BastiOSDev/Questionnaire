//
//  QuestionEntry.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

struct QuestionEntry: Equatable, Hashable {
    private var _question: String!
    var question: String! {
        if _question.starts(with: "?") {
            let range: Range = _question.index(after: _question.startIndex)..<_question.endIndex
            return String(_question[range]) + "?"
        }
        return _question
    }
    var answers: [String] = [String]()
    var correctAnswer: Int!
    var selectedAnswer: Int?
    
    init(array: [String]) {
        if lessThanOneElement(array) {
            fatalError()
        }
        for value in array {
            if value == array.first {
                _question = value
                continue
            }
            appendAnswer(value)
        }
        answers.append("Don't know")
    }
    
    private mutating func appendAnswer(_ value: String) {
        if isCorrectAnswer(value) {
            let range: Range = value.index(after: value.startIndex)..<value.endIndex
            let answer: String! = String(value[range])
            answers.append(answer)
            correctAnswer = answers.count - 1
            return
        }
        answers.append(value)
    }
    
    private func lessThanOneElement(_ array: [String]) -> Bool {
        return array.count < 2
    }
    
    private func isCorrectAnswer(_ value: String) -> Bool {
        return value.starts(with: "*")
    }
}
