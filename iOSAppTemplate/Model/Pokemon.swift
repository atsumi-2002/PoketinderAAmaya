//
//  Pokemon.swift
//  iOSAppTemplate
//
//  Created by MAC34 on 25/06/22.
//

struct Pokemon: Codable {
     let count: Int?
     let next: String?
     let results: [Result]
 }

 struct Result: Codable {
     let name: String
     let url: String
 }
