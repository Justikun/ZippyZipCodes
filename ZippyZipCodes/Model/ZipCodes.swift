//
//  ZipCodesModel.swift
//  ZippyZipCodes
//
//  Created by Justin Lowry on 2/10/22.
//

import SwiftUI

struct ZipCode: Hashable, Codable {
    var places: [Place]
}

struct Place: Hashable, Codable {
    var placeName: String
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case placeName = "place name"
        case state
    }
}
