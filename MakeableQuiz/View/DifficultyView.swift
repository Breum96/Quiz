//
//  DifficultyView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import SwiftUI

struct DifficultyView: View {
    @EnvironmentObject var viewModel : QuizViewModel
    var body: some View {
        NavigationView{
            List(viewModel.difficultys, id: \.rawValue) { difficulty in
                NavigationLink(destination: QuizView().onAppear{viewModel.setSelectedDifficulty(difficulty: difficulty)}){
                    Text(difficulty.rawValue)
                }
            }
            /*List(viewModel.difficultys, id: \.rawValue) { difficulty in
                NavigationLink(destination: QuizView()){
                    Text(difficulty.rawValue)
                }
                .onTapGesture {
                    viewModel.setSelectedDifficulty(difficulty: difficulty)
                }
            }*/
            .navigationTitle("Difficulty")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
            .environmentObject(QuizViewModel())
    }
}
