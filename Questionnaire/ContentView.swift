//
//  ContentView.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    let content: [QuestionEntry]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(content, id: \.self) { entry in
                VStack {
                    Text(entry.question)
                    ForEach(entry.answers, id: \.self) { answer in
                        Text(answer)
                    }
                }
            }
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
