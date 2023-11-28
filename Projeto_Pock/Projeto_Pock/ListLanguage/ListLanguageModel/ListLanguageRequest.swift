import Foundation

private let basePath = "https://run.mocky.io/v3/57e9e393-987c-47e5-9c12-265ffb8f7d3a"
private let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["ContentType" : "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
private let session = URLSession(configuration: configuration)
    
func loadLanguages() {
        guard let url = URL(string: basePath) else {return}
        let dataTask = session.dataTask(with: url) { (data: Data?, respense: URLResponse?, error: Error?) in
            if error == nil {
                guard let respense = respense as? HTTPURLResponse else {return}
                
                if respense.statusCode == 200 {
                    
                    guard let data = data else {return}
                    
                    do {
                        let header = try JSONDecoder().decode(ListLanguageResponse.self, from: data)
                        print(header)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Algum status inválido pelo servidor!")
                }
            } else {
                print(error)
            }
        }
        
        dataTask.resume()
    }
