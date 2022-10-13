//
//  ContentView.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = QuizViewModel()
   
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the quiz")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                
                
                NavigationLink {
                    CategoryView()
                        .environmentObject(viewModel)
                } label: {
                    Text("Choose Category")
                    
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .padding()
                
                
                    
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
      
        
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
