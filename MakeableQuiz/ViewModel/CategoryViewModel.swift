



@MainActor
class CategoryViewModel: ObservableObject {
    @Published var categorys : [Category] = []
    @Published var selectedCategory : Category? = nil
    private let networkservice = NetworkService()
    
    
    func loadQuiz()  {
        Task(priority: .high){
            do {
                let quiz = try await networkservice.fetchQuiz()
                print(quiz)
                //DispatchQueue.main.async {
                    //escaping closure
                    questions = quiz.questions
                //}
            }
            catch{
                print("\(error)")

            }
        }
    }
    
    func setSelectedCategory(category : Category) {
        selectedCategory = category
    }
    
    func getQuestions()
    
    /*func fetch() {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let quizes = try JSONDecoder().decode([Quiz].self, from: data)
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }*/
}
