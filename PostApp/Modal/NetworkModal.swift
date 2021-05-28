//
//  NetworkModal.swift
//  PostApp
//
//  Created by Евгений Фирман on 27.05.2021.
//


import Foundation

class NetworkModal: ObservableObject {
    
    @Published var posts = [Item]()
    
    func fetchData(){
        if let url = URL(string:"https://k8s-stage.apianon.ru/posts/v1/posts"){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        
                        do {
                            
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                
                                self.posts = results.data.items
                                print(results.data.items[0].contents[0].data.value)
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
