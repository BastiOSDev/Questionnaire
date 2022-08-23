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
        self.resultFormatter = ResultFormatter(report: calculator.report)
    }
    
    var body: some View {
        let report = calculator.report
        
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .center) {
                Text(resultFormatter.getHeadline())
            }
            VStack(alignment: .leading, spacing: 30) {
                ForEach(report.resultText, id: \.self) { result in
                    VStack(alignment: .leading) {
                        Text(resultFormatter.getQuestion(for: result))
                            .bold()
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text(resultFormatter.getAnswer(for: result))
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Your score")
    }
}
