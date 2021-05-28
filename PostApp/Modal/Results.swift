//
//  Results.swift
//  PostApp
//  Created by Евгений Фирман on 27.05.2021.
//

import Foundation

struct Results: Decodable {
    let data: Data
}
struct Data: Decodable {
    let items: [Item]
    let cursor: String
}
struct Item: Decodable,Identifiable {
    var identification: String  {
        return id
    }
    let contents: [Contents]
    let id: String
    let author: Author
}
struct Author: Decodable {
    let name: String
}
struct Contents: Decodable{
    let data: Val
    let type: String
}
struct Val: Decodable{
    let value: String?
}


