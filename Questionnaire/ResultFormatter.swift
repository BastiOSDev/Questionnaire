//
//  TextFormatter.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 18.08.22.
//

struct ResultFormatter {
    let report: Report
    
    func getHeadline() -> String {
        let percentagesAsInt = cutDecimalDigits(report.correctPercentages)
        return "\(report.numberOfCorrectAnswers) out of \(report.numberOfQuestions) questions answered correctly (\(percentagesAsInt)%)"
    }
    
    private func cutDecimalDigits(_ input: Double) -> Int {
        return Int(input)
    }
    
    func getQuestion(for result: ResultText) -> String {
        return result.question
    }
    
    func getAnswer(for result: ResultText) -> String {
        if result.isCorrect {
            return "Your answer '\(result.selectedAnswer)' is correct"
        } else {
            let text = """
                        Your answer '\(result.selectedAnswer)' is wrong
                        Correct answer: '\(result.correctAnswer)'
                        """
            return text
        }
    }
}
