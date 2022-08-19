//
//  FileReader.swift
//  Questionnaire
//
//  Created by Sebastian-Falk Birchner on 15.08.22.
//

import Foundation

class FileReader {
    func readQuestionFile(file: URL) -> [String] {
        do {
            try checkFile(url: file)
            return try getContent(file)
        } catch {
            return []
        }
    }
    
    private func checkFile(url: URL) throws {
        if url.pathExtension != "txt" {
            print("error")
        }
    }
    
    private func getContent(_ file: URL) throws -> [String] {
        let content = try String(contentsOf: file)
        let parsedtxt: [String] = content.components(
            separatedBy: "\n"
        ).map{ $0.components(separatedBy: "")[0] }
        return parsedtxt
    }
}
