//
//  QuizModel.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 05/10/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct Quiz: Codable {
    let responseCode: Int
    let questions: [Question]
  
    enum CodingKeys: String, CodingKey{
        case questions = "results"
        case responseCode
    }
    
    
}

struct Question: Codable {
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]
    
    var formattedQuestion: AttributedString {
        do {
            return try AttributedString(markdown: question)
        } catch {
            print(error)
            return ""
        }
    }
    
    
    var answers: [Answer]{
        do{
            let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
            let incorrect = try incorrectAnswers.map { answer in
                Answer(text: try AttributedString(markdown: answer), isCorrect: false)
            }
            let allAnswers = correct + incorrect
            
            return allAnswers.shuffled()
        } catch {
            print(error)
            return []
        }
    }
}

enum Difficulty: String, Codable, CaseIterable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum QuestionType: String, Codable {
    case boolean = "boolean"
    case multiple = "multiple"
}


