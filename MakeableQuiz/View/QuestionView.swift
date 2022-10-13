//
//  QuestionView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel : QuizViewModel
    var body: some View {
        
        VStack(spacing: 50){
            
            VStack(spacing: 20){
                Text(viewModel.question)
                    .font(.title2)
                    .padding(40)
                    
                ForEach(viewModel.answerChoices, id: \.id) { answer in
                    AnswerComponent(answer: answer)
                        .environmentObject(viewModel)
                }
            }
            
            Button("Next Question"){
                viewModel.nextQuestion()
                
            }
            .background(viewModel.selectedAnswer ? .blue : .gray)
            .buttonStyle(.borderedProminent)
            .foregroundColor(.white)
            .padding()
            .disabled(!viewModel.selectedAnswer)
            .navigationBarBackButtonHidden(true)
            
            Spacer()
        }
        .onAppear{
            viewModel.loadQuiz()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizViewModel())
    }
}
