import Foundation

protocol ListLanguageServiceProtocol {
    func fetchLanguageList(completion: @escaping (Result<ListLanguageResponse, Error>) -> Void)
}

class ListLanguageService: ListLanguageServiceProtocol {
    func fetchLanguageList(completion: @escaping (Result<ListLanguageResponse, Error>) -> Void) {
        // URL da API
        guard let apiUrl = URL(string: "https://run.mocky.io/v3/57e9e393-987c-47e5-9c12-265ffb8f7d3a") else {
            completion(.failure(NSError(domain: "URLError", code: 0, userInfo: nil)))
            return
        }

        // Criação da URL a partir da string
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"

    }
}

