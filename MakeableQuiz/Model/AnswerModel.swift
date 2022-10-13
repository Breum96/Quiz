//
//  AnswerModel.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
