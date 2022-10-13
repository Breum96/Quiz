//
//  EndView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 10/10/2022.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var body: some View {
        VStack{
            Text("Quiz Completed")
            Text("You got \(viewModel.score) out of \(viewModel.length) questions correct!")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
            .environmentObject(QuizViewModel())
    }
}
