//
//  QuestionEntry.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

struct QuestionEntry: Equatable, Hashable {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    let selectedAnswer: Int?
}
