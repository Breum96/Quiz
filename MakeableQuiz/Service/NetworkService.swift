//
//  NetworkService.swift
//  MakeableQuiz
//
//  Created by dmu mac 32 on 05/10/2022.
//

import Foundation

class NetworkService{
    
    func fetchQuiz(cateogry: TriviaCategory?, difficulty: Difficulty?) async throws -> Quiz {
        var url = URL(string: "https://opentdb.com/api.php?amount=10")!
        
        if  let cateogry = cateogry {
            url.append(queryItems:[URLQueryItem(name: "category", value: cateogry.id.description)])
        }
    
        
        if let difficulty = difficulty {
            url.append(queryItems:[URLQueryItem(name: "difficulty", value: difficulty.rawValue)])
        }
        
            
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(Quiz.self, from: data)
    }
    
    
    
    func fetchCategory() async throws -> Category {
        let categoryURL = URL(string: "https://opentdb.com/api_category.php")!
        let (data, _) = try await URLSession.shared.data(from: categoryURL)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(Category.self, from: data)
    }
}
