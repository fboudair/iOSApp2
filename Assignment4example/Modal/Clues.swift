//
//  Clues.swift
//  Assignment4example
//
//  Created by Louise Rennick on 2025-02-06.
//

import Foundation
import SwiftUI
import PhotosUI


// MARK: - Model for Clues
struct Clue: Identifiable, Codable {
    var id = UUID()
    let text: String
    let location: String
    var found: Bool = false
    var image: Data? 
    
    enum CodingKeys: String, CodingKey {
        case text
        case location
        case found
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.location = try container.decode(String.self, forKey: .location)
        self.found = try container.decodeIfPresent(Bool.self, forKey: .found) ?? false
        self.image = try container.decodeIfPresent(Data.self, forKey: .image)
        self.id = UUID()
    }
    init(text: String, location: String) {
            self.text = text
            self.location = location
            self.id = UUID()
            self.found = false
            self.image = nil
        }
}
