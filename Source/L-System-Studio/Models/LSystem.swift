//
//  LSystem.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/5/20.
//  Copyright © 2020 HSY Tehcnologies. All rights reserved.
//

import SwiftUI

class LSystem: Codable, ObservableObject {
    
    @Published var axiom: String
    @Published var rules: [LSRule]
    
    init(axiom: String = "", rules: [LSRule] = []) {
        self.axiom = axiom
        self.rules = rules
    }
    
    enum Keys: CodingKey {
        case axiom
        case rules
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        axiom = try container.decode(String.self, forKey: .axiom)
        rules = try container.decode([LSRule].self, forKey: .rules)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(axiom, forKey: .axiom)
        try container.encode(rules, forKey: .rules)
    }
}

// MARK: -

struct LSRule: Codable, Identifiable {
    public let id = UUID()
    
    var A: String
    var B: String
    
    enum Keys: CodingKey {
        case A
        case B
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(A, forKey: .A)
        try container.encode(B, forKey: .B)
    }
}
