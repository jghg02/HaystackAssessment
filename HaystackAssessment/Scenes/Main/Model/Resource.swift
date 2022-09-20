//
//  Resource.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 18-09-22.
//

import Foundation

struct Resource: Codable {
    let sizes: Size
}

struct Size: Codable {
    let canblog: Int
    let canprint: Int
    let candownload: Int
    let size: [Image?]
}

struct Image: Codable {
    let label: String
    let width: Int
    let height: Int
    let source: String
    let url: String
    let media: String
}
