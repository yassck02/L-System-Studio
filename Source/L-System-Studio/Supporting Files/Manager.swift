//
//  Manager.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/8/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import Combine

class Manager: ObservableObject {
    
    var engine: LSystemEngine!
    
    var turtle: Turtle!
    
    var turtleView: TurtleView!
    
    init(engine: LSystemEngine, turtleView: TurtleView) {
        self.engine = engine
        self.turtleView = turtleView
    }
    
    func updateTurtleView() {
        turtleView.render(sentance: engine.sentance)
        turtleView.setNeedsDisplay()
    }
}
