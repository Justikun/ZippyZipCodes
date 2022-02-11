//
//  ZipCodesController.swift
//  ZippyZipCodes
//
//  Created by Justin Lowry on 2/10/22.
//

import Foundation
import SwiftUI

class ZipCodeModel: ObservableObject {
    @Published var result: String?
    
    /// Fetches state and city name given zip code (United States)
    func fetch(zipCode: String) async throws {
        // Creating URL Components
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.zippopotam.us"
        components.path = "/US/\(zipCode)"
        
        // Creating URL for United States zip codes
        guard let url = components.url else { return print("err creating URL") }
        let urlRequest = URLRequest(url: url)
        
        // URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            self.result = "Invalid Zip Code"
            return
        }
        
        // Decode and set publish zipCode
        let decodedZipCode = try JSONDecoder().decode(ZipCode.self, from: data)
        
        // Parsing data to a readable format
        guard let state = decodedZipCode.places.first?.state,
              let city = decodedZipCode.places.first?.placeName else {
                  self.result = "Unable to get City and State"
                  return
              }
        // Setting result
        self.result = "\(city) \(state)"
    }
}
