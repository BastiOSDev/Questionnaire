//
//  Report.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

struct Report: Equatable {
    let numberOfCorrectAnswers: Int
    let numberOfQuestions: Int
    let resultText: [ResultText]
}
