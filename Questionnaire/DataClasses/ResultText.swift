//
//  ResultText.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

struct ResultText: Equatable, Hashable {
    let question: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}
