// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct Category: Codable {
    let triviaCategories: [TriviaCategory]

    enum CodingKeys: String, CodingKey {
        case triviaCategories
    }
}

struct TriviaCategory: Codable {
    let id: Int
    let name: String
}
