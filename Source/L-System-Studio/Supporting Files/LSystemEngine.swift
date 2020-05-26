//
//  LSystemEngine.swift
//  L-System-Studio
//
//  Created by Connor yass on 8/10/19.
//  Copyright © 2019 HSY Tehcnologies. All rights reserved.
//

import Combine
import CBTLogger

class LSystemEngine: ObservableObject {
    
    // MARK: Properties
    
    private(set) var lsystem: LSystem
    
    @Published private(set) var sentance: String = ""
    
    @Published private(set) var iterationCount: Int = 0
    
    let maxIterations: Int = 10
    
    // MARK: Interface
    
    func iterate() {
        iterationCount += 1
        iterationCount = min(iterationCount, maxIterations)
        
        if iterationCount <= maxIterations {
            generateIteration(iterationCount)
        }
    }
    
    func deiterate() {
        iterationCount -= 1
        iterationCount = max(iterationCount, 0)
        
        if iterationCount >= 0 {
            generateIteration(iterationCount)
        }
    }
    
    func reset() {
        sentance.removeAll(keepingCapacity: true)
        iterationCount = 0
    }
    
    // MARK: Lifecycle
    
    init(lsystem: LSystem) {
        self.lsystem = lsystem
        sentance.reserveCapacity(1000000)
    }
    
    // MARK: Helper Functions
    
    private func generateIteration(_ count: Int) {
        sentance = lsystem.axiom
        
        for _ in 0..<count {
            for rule in lsystem.rules {
                sentance = sentance.replacingOccurrences(of: rule.A, with: rule.B)
            }
        }
    }
}
