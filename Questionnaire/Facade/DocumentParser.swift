//
//  DocumentParser.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import Foundation

class DocumentParser {
    static func getQuestionEntries(_ documentStrings: [String]) -> [QuestionEntry] {
        var questionEntries = [QuestionEntry]()
        
        var questionArray: [String]! = [String]()
        for (index, line) in documentStrings.enumerated() {
            if DocumentParser.isQuestion(line) {
                if !questionArray.isEmpty {
                    let entry = DocumentParser.getQuestionEntry(questionArray)
                    questionEntries.append(entry)
                }
                questionArray = [String]()
            }
            questionArray.append(line)
            if index == documentStrings.count - 1 {
                if !questionArray.isEmpty {
                    let entry = DocumentParser.getQuestionEntry(questionArray)
                    questionEntries.append(entry)
                }
            }
        }
        
        return questionEntries
    }
    
    private static func getQuestionEntry(_ questionBlock: [String]) -> QuestionEntry {
        return QuestionEntry(array: questionBlock)
    }
    
    private static func isQuestion(_ possibleString: String) -> Bool {
        return possibleString.starts(with: "?")
    }
}
