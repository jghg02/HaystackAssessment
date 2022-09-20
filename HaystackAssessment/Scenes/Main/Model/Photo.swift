//
//  Photo.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 15-09-22.
//

import Foundation


struct Photo: Codable {
    var photos: Photos
}

struct Photos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [PhotoData?]
}

struct PhotoData: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let title: String
}
