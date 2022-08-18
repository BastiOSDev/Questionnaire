//
//  DocumentParser.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import Foundation

class DocumentParser {
    func getQuestionEntries(_ documentStrings: [String]) -> [QuestionEntry] {
        let firstQuestion = documentStrings[0]
        var questionBlock = [firstQuestion]
        var questionEntries = [QuestionEntry]()
        
        let stringsWithoutFirst = removeFirst(documentStrings)
        
        for (index, line) in stringsWithoutFirst.enumerated() {
            if !isQuestion(line) {
                questionBlock.append(line)
                
                if isLastElement(index, array: stringsWithoutFirst) {
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
        let question = formatLine(questionBlock[0], append: "?")
        var answerBlock = removeFirst(questionBlock)
        var correctAnswer = 0
        
        for (index, line) in answerBlock.enumerated() {
            if isCorrectAnswer(line) {
                correctAnswer = index
                answerBlock[index] = formatLine(line)
            }
        }
        
        answerBlock = addDontKnowAnswer(answerBlock)
        
        return QuestionEntry(question: question, answers: answerBlock, correctAnswer: correctAnswer, selectedAnswer: nil)
    }
    
    private func addDontKnowAnswer(_ array: [String]) -> [String] {
        var newArray = array
        newArray.append("Don't know")
        return newArray
    }
    
    private func isQuestion(_ possibleString: String) -> Bool {
        return possibleString.starts(with: "?")
    }
    
    private func isCorrectAnswer(_ possibleString: String) -> Bool {
        return possibleString.starts(with: "*")
    }
    
    private func isLastElement(_ index: Int, array: [String]) -> Bool {
        return index == array.count - 1
    }
    
    private func removeFirst(_ questionBlock: [String]) -> [String] {
        var answerBlock = questionBlock
        answerBlock.removeFirst()
        return answerBlock
    }
    
    private func formatLine(_ unformattedString: String, append: String = "") -> String {
        var formattedString = unformattedString
        formattedString.remove(at: formattedString.startIndex)
        formattedString.append(append)
        return formattedString
    }
    
    }
