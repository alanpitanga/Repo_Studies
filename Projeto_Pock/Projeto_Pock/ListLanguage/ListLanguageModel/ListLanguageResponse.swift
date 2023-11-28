import Foundation

struct ListLanguageResponse: Codable {
    let scenetitle: String
    let linguagens: [Language]
}

extension ListLanguageResponse {
    struct Language: Codable {
            let id: Int
            let nome: String
            let destino: String
    }
}

