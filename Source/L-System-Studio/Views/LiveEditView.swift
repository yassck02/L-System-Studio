//
//  LiveEditView.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/5/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

struct LiveEditView: View {
    
    @EnvironmentObject var engine: LSystemEngine
    
    @EnvironmentObject var turtleView: TurtleView
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Iterate")) {
                    HStack {
                        Stepper(onIncrement: {
                            self.onIncrement()
                        }, onDecrement: {
                            self.onDecrament()
                        }) {
                            Text("Count: \(engine.iterationCount)/\(engine.maxIterations)")
                        }
                    }
                    Button(action: {
                        self.onReset()
                    }) {
                        Text("Reset")
                    }
                }
                Section(header:
                    HStack {
                        Text("String (\(engine.sentance.count) characters)")
                        Spacer()
                        Button(action: {
                            print(self.engine.sentance)
                        }) {
                            Text("Copy")
                        }
                    }
                ) {
                    Text(engine.sentance)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Live Edit", displayMode: .inline)
        }
        .tabItem {
            Image(systemName: "play")
            Text("Edit")
        }
    }
    
    func onIncrement() {
        engine.iterate()
        updateTurtleView()
    }
    
    func onDecrament() {
        engine.deiterate()
        updateTurtleView()
    }
    
    func onReset() {
        engine.reset()
        updateTurtleView()
    }
    
    func onCopy() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = engine.sentance
    }
    
    func updateTurtleView() {
        turtleView.render(sentance: engine.sentance)
    }
}

#if DEBUG
struct LiveEditView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabView {
            LiveEditView()
        }
    }
}
#endif
