//
//  QuizViewModel.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 05/10/2022.
//

import Foundation

@MainActor
class QuizViewModel: ObservableObject {
    @Published var questions : [Question] = []
    @Published var categorys : [TriviaCategory] = []
    @Published var difficultys = Difficulty.allCases
    @Published var answerChoices: [Answer] = []
    
    @Published var selectedCategory : TriviaCategory? = nil
    @Published var selectedDifficulty : Difficulty? = nil
    @Published var selectedAnswer = false
    
    @Published var length = 0
    @Published var index = 0
    @Published var end = false
    @Published var question : AttributedString = ""
    @Published var score = 0
    

    
    private let networkservice = NetworkService()
    
    
    func loadQuiz()  {
        Task(priority: .high){
            do {
                let quiz = try await networkservice.fetchQuiz(cateogry: selectedCategory, difficulty: selectedDifficulty)
                questions = quiz.questions
                length = questions.count
                print(questions.count)
                setQuestion()
            }
            catch{
                print("\(error)")

            }
        }
    }
    
    func loadCategorys() {
        Task(priority: .high) {
            do {
                let category = try await networkservice.fetchCategory()
                categorys = category.triviaCategories
            }
            catch{
                print("\(error)")
            }
        }
    }
    
    func setSelectedCategory(category : TriviaCategory) {
        selectedCategory = category
        print(category.name)
    }
    
    func setSelectedDifficulty(difficulty : Difficulty) {
        selectedDifficulty = difficulty
        print(difficulty.rawValue)
       
    }
    
    func nextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
            print(end)
        }else{
            end = true
            print(end)
        }
    }
    
    func setQuestion() {
        selectedAnswer = false
        
        if index < length {
            let current = questions[index]
            question = current.formattedQuestion
            answerChoices = current.answers
        }
    }
    
    func selectAnswer(answer: Answer){
        selectedAnswer = true
        if answer.isCorrect {
            score += 1
        }
    }
    

}
