//
//  ResultView.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 18.08.22.
//

import SwiftUI

struct ResultView: View {
    private let calculator: Calculator
    private let resultFormatter: ResultFormatter
    
    init(calculator: Calculator) {
        self.calculator = calculator
        self.resultFormatter = ResultFormatter(report: calculator.getReport())
    }
    
    var body: some View {
        let report = calculator.getReport()
        
        VStack(spacing: 20) {
            Text(resultFormatter.getHeadline())
            
            VStack(spacing: 30) {
                ForEach(report.resultText, id: \.self) { result in
                    VStack {
                        Text(resultFormatter.getQuestion(for: result))
                            .bold()
                        Text(resultFormatter.getAnswer(for: result))
                    }
                }
            }
            
        }.navigationTitle("Your score")
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
