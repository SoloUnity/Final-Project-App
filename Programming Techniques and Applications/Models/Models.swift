//
//  Models.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-13.
//

import Foundation

struct Module: Decodable, Identifiable{
    
    var id: Int
    var category: String
    var content: Content
    
}

struct Content: Decodable, Identifiable{
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
    
    
}

struct Lesson: Decodable, Identifiable{
    
    var id: Int
    var title: String
    var video: String
    var pages: String
    
}


struct Question: Decodable, Identifiable{
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}


