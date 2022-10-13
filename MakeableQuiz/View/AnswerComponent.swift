//
//  AnswerView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import SwiftUI

struct AnswerComponent: View {
    @EnvironmentObject var viewModel : QuizViewModel
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack{
           Image(systemName: "circle")
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding(25)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(viewModel.selectedAnswer ? (isSelected ? .blue : .gray) : .blue)
        .background(.white)
        .cornerRadius(50)
        .shadow(color: isSelected ? answer.isCorrect ? .green : .red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if viewModel.selectedAnswer == false{
                isSelected = true
                viewModel.selectAnswer(answer: answer)
            }
           
        }
    }
}

struct AnswerComponent_Previews: PreviewProvider {
    static var previews: some View {
        AnswerComponent(answer: Answer(text: "yo", isCorrect: false))
            .environmentObject(QuizViewModel())
    }
}
