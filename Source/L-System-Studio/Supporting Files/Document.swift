//
//  Document.swift
//  test
//
//  Created by Connor yass on 7/17/19.
//  Copyright © 2019 HSY Tehcnologies. All rights reserved.
//

import UIKit

struct DocumentPayload: Codable {
    var turtle: Turtle
    var lSystem: LSystem
    var properties: DocumentProperties
}

class Document: UIDocument {
    
    var turtle: Turtle!
    var lSystem: LSystem!
    var properties: DocumentProperties!
    
    override func contents(forType typeName: String) throws -> Any {
        let payload: Data = try JSONEncoder().encode(
            DocumentPayload(
                turtle: self.turtle,
                lSystem: self.lSystem,
                properties: self.properties
            )
        )
        return payload
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        let payload = try JSONDecoder().decode(DocumentPayload.self, from: contents as! Data)
        self.turtle = payload.turtle
        self.lSystem = payload.lSystem
        self.properties = payload.properties
    }
}

