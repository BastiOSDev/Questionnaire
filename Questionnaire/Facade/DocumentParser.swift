//
//  DocumentParser.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import Foundation

class DocumentParser {
    func getQuestionEntries(_ documentStrings: [String]) -> [QuestionEntry] {
        var isFirstQuestion = true
        var questionBlock = [String]()
        var questionEntries = [QuestionEntry]()
        
        for line in documentStrings {
            if isFirstQuestion {
                isFirstQuestion = false
                questionBlock.append(line)
            } else if !isQuestion(line) {
                questionBlock.append(line)
                
                if isLastElement(line, array: documentStrings) {
                    questionEntries.append(getQuestionEntry(questionBlock))
                }
            } else {
                questionEntries.append(getQuestionEntry(questionBlock))
                questionBlock = [line]
            }
        }
        
        return questionEntries
    }
    
    func getQuestionEntry(_ questionBlock: [String]) -> QuestionEntry {
        var question = ""
        var answer = [String]()
        var correctAnswer = 0
        
        for (index, line) in questionBlock.enumerated() {
            if isQuestion(line) {
                question = formatLine(line, append: "?")
            } else if isCorrectAnswer(line) {
                correctAnswer = index - 1
                answer.append(formatLine(line))
            } else {
                answer.append(line)
            }
        }
        
        return QuestionEntry(question: question, answers: answer, correctAnswer: correctAnswer, selectedAnswer: nil)
    }
    
    private func isQuestion(_ possibleString: String) -> Bool {
        return possibleString.starts(with: "?")
    }
    
    private func isCorrectAnswer(_ possibleString: String) -> Bool {
        return possibleString.starts(with: "*")
    }
    
    private func isLastElement(_ element: String, array: [String]) -> Bool {
        return element == array.last
    }
    
    private func formatLine(_ unformattedString: String, append: String = "") -> String {
        var formattedString = unformattedString
        formattedString.remove(at: formattedString.startIndex)
        formattedString.append(append)
        return formattedString
    }
    
    }
