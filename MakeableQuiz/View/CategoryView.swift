//
//  CategoryView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 09/10/2022.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var viewModel : QuizViewModel
    var body: some View {
        NavigationView{
            List(viewModel.categorys, id: \.id){ category in
                NavigationLink(destination: DifficultyView()){
                    Text(category.name)
                    
                    }
                .onTapGesture {
                    viewModel.setSelectedCategory(category: category)
                }
                }
            .navigationTitle("Categorie's")
            }
        .navigationBarBackButtonHidden(true)
       
        .onAppear{
            viewModel.loadCategorys()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(QuizViewModel())
    }
}
