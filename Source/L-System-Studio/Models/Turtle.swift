//
//  Turtle.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/5/20.
//  Copyright © 2020 HSY Tehcnologies. All rights reserved.
//

import SwiftUI

class Turtle: Codable, ObservableObject {
    
    @Published var leftRotateAngle: Float
    @Published var rightRotateAngle: Float
    @Published var moveDistance: Float
    
    init(leftRotateAngle: Float = 60, rightRotateAngle: Float = 60, moveDistance: Float = 10) {
        self.leftRotateAngle = leftRotateAngle
        self.rightRotateAngle = rightRotateAngle
        self.moveDistance = moveDistance
    }
    
    enum Keys: CodingKey {
        case leftRotateAngle
        case rightRotateAngle
        case moveDistance
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        leftRotateAngle = try container.decode(Float.self, forKey: .leftRotateAngle)
        rightRotateAngle = try container.decode(Float.self, forKey: .rightRotateAngle)
        moveDistance = try container.decode(Float.self, forKey: .moveDistance)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(leftRotateAngle, forKey: .leftRotateAngle)
        try container.encode(rightRotateAngle, forKey: .rightRotateAngle)
        try container.encode(moveDistance, forKey: .moveDistance)
    }
}

enum TurtleAction: Character, CaseIterable {
    case turnLeft = "-"
    case turnRight = "+"
    case moveForward = "F"
    case jumpForward = "f"
    case pushStateToStack = "["
    case popStateFromStack = "]"
}

struct TurtleState {
    var position: SIMD2<Float>
    var angle: Float
}
