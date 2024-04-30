//
//  Response.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import Foundation

struct Response: Decodable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
}
