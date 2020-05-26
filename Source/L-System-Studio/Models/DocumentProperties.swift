//
//  DocumentProperties.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/6/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

class DocumentProperties: Codable, ObservableObject {
    
    @Published var backgroundColor: CBColor
    @Published var strokeGradient: CBGradient
    
    init(backgroundColor: CBColor = .white,
         strokeGradient: CBGradient = .sunrise)
    {
        self.backgroundColor = backgroundColor
        self.strokeGradient = strokeGradient
    }
    
    enum Keys: CodingKey {
        case backgroundColor
        case strokeGradient
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        backgroundColor = try container.decode(CBColor.self, forKey: .backgroundColor)
        strokeGradient = try container.decode(CBGradient.self, forKey: .strokeGradient)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(backgroundColor, forKey: .backgroundColor)
        try container.encode(strokeGradient, forKey: .strokeGradient)
    }
}
