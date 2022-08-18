//
//  QuestionnaireApp.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import SwiftUI

@main
struct QuestionnaireApp: App {
    var body: some Scene {
        WindowGroup {
            let fileReader = FileReader()
            let url = Bundle.main.url(forResource: "Questionnaire", withExtension: "txt")!
            let file = DocumentParser().getQuestionEntries(fileReader.readQuestionFile(file: url))
            
            ContentView(content: file)
        }
    }
}
