//
//  CBColor.swift
//  ColorTools-Demo
//
//  Created by Connor yass on 4/2/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

class CBColor: ObservableObject, Codable {
    
    @Published var h: Float
    @Published var s: Float
    @Published var b: Float
    @Published var a: Float
    
    init(h: Float = 0, s: Float = 0, b: Float = 1, a: Float = 1) {
        self.h = h
        self.s = s
        self.b = b
        self.a = a
    }
    
    enum CodingKeys: CodingKey {
        case h, s, b, a
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        h = try container.decode(Float.self, forKey: .h)
        s = try container.decode(Float.self, forKey: .s)
        b = try container.decode(Float.self, forKey: .b)
        a = try container.decode(Float.self, forKey: .a)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(h, forKey: .h)
        try container.encode(s, forKey: .s)
        try container.encode(b, forKey: .b)
        try container.encode(a, forKey: .a)
    }
}

// MARK: -

extension CBColor: Equatable, Hashable {
    
    static func == (lhs: CBColor, rhs: CBColor) -> Bool {
        return (
            lhs.h == rhs.h &&
            lhs.s == rhs.s &&
            lhs.b == rhs.b &&
            lhs.a == rhs.a
        )
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(h)
        hasher.combine(s)
        hasher.combine(b)
        hasher.combine(a)
    }
}

// MARK: -

extension CBColor {
    
    static let white:  CBColor = CBColor(h: 0.00, s: 0.0, b: 1.0, a: 1.0)
    static let gray:   CBColor = CBColor(h: 0.00, s: 0.5, b: 0.5, a: 1.0)
    static let black:  CBColor = CBColor(h: 0.00, s: 0.0, b: 0.0, a: 1.0)
    
    static let red:    CBColor = CBColor(h: 0.00, s: 1.0, b: 1.0, a: 1.0)
    static let orange: CBColor = CBColor(h: 0.15, s: 1.0, b: 1.0, a: 1.0)
    static let yellow: CBColor = CBColor(h: 0.20, s: 1.0, b: 1.0, a: 1.0)
    static let green:  CBColor = CBColor(h: 0.45, s: 1.0, b: 1.0, a: 1.0)
    static let blue:   CBColor = CBColor(h: 0.60, s: 1.0, b: 1.0, a: 1.0)
    static let purple: CBColor = CBColor(h: 0.75, s: 1.0, b: 1.0, a: 1.0)
    static let pink:   CBColor = CBColor(h: 0.80, s: 1.0, b: 1.0, a: 1.0)
}

// MARK: -

extension CBColor {
    
    var swiftUIColor: Color {
        return Color(hue: Double(h), saturation: Double(s), brightness: Double(b), opacity: Double(a))
    }
}

// MARK: -

extension CBColor {
    
    var uiColor: UIColor {
        return UIColor(hue: CGFloat(h), saturation: CGFloat(s), brightness: CGFloat(b), alpha: CGFloat(a))
    }
    
    convenience init(uicolor: UIColor) {
        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        
        uicolor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        self.init(h: Float(h), s: Float(s), b: Float(b), a: Float(a))
    }
}
