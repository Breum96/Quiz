//
//  QuizView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import SwiftUI


struct QuizView: View{
    @EnvironmentObject var viewModel : QuizViewModel
    
    var body: some View{
        if viewModel.end{
            EndView()
                .environmentObject(viewModel)
        }else{
            QuestionView()
                .environmentObject(viewModel)
        }
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
