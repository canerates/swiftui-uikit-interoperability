//
//  ImageService.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

class ImageService: ObservableObject {
    
    static let shared = ImageService()
    
    func fetchImage(with urlString: String) async throws -> UIImage? {
        
        guard let url =  URL(string: urlString) else {
            print("Error: Invalid image url")
            return nil
        }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("Error: Bad image request")
            return nil
        }
        
        guard let uiImage = UIImage(data: data) else {
            print("Error: Unsupported image")
            return nil
        }
        
        return uiImage
    }
}
