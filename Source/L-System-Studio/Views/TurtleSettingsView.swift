//
//  TurtleSettingsController.swift
//  L_System_Studio
//
//  Created by Connor yass on 11/22/17.
//  Copyright © 2017 Connor yass. All rights reserved.
//

import SwiftUI

struct TurtleSettingsView: View {
        
    @EnvironmentObject var turtle: Turtle
    
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Rotation")) {
                    CBTextSlider(value: Binding<Float>(
                        get: { return self.turtle.leftRotateAngle },
                        set: {
                            self.turtle.leftRotateAngle = $0
                            self.manager.updateTurtleView()
                        }), title: "Left"
                    )
                    CBTextSlider(value: Binding<Float>(
                        get: { return self.turtle.rightRotateAngle },
                        set: {
                            self.turtle.rightRotateAngle = $0
                            self.manager.updateTurtleView()
                        }), title: "Right"
                    )
                }
                Section(header: Text("Movement")) {
                    CBTextSlider(value: Binding<Float>(
                        get: { return self.turtle.moveDistance },
                        set: {
                            self.turtle.moveDistance = $0
                            self.manager.updateTurtleView()
                        }), title: "Distance"
                    )
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Turtle Settings", displayMode: .inline)
        }
        .tabItem {
            Image(systemName: "tortoise")
            Text("Turtle")
        }
    }
}

#if DEBUG
struct TurtleSettingsView_Previews: PreviewProvider {
    
    static var turtle = Turtle(leftRotateAngle: 60, rightRotateAngle: 90, moveDistance: 10)
        
    static var previews: some View {
        TabView {
            TurtleSettingsView()
        }
        .environmentObject(turtle)
    }
}
#endif
