//
//  L_SystemSettingsController.swift
//  L_System_Studio
//
//  Created by Connor yass on 11/29/17.
//  Copyright © 2017 Connor yass. All rights reserved.
//

import SwiftUI

struct RuleCell: View {
    
    @State var rule: LSRule
    
    var body: some View {
        HStack {
            TextField("", text: $rule.A)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
            Image(systemName: "arrow.right")
                .foregroundColor(Color.gray)
            TextField("", text: $rule.B)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

// MARK: -

struct LSystemSettingsView: View {
    
    @EnvironmentObject var lsystem: LSystem
    
    @EnvironmentObject var engine: LSystemEngine
    
    @State private var editMode = EditMode.inactive
    
    private var addButton: some View {
        switch editMode {
            case .inactive:
                return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
            default:
                return AnyView(EmptyView())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Axiom")) {
                    TextField("", text: $lsystem.axiom)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: HStack {
                    Text("Rules")
                }) {
                    ForEach(lsystem.rules) { rule in
                        RuleCell(rule: rule)
                    }
                    .onDelete(perform: onDelete)
                    .onMove(perform: onMove)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("L System", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }
        .tabItem {
            Image(systemName: "cube")
            Text("L System")
        }
    }
    
    private func onAdd() {
        lsystem.rules.append(LSRule(A: "F", B: "FF"))
        engine.reset()
    }
    
    private func onDelete(offsets: IndexSet) {
        lsystem.rules.remove(atOffsets: offsets)
        engine.reset()
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        lsystem.rules.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct LSystemSettingsView_Previews: PreviewProvider {
    
    static var lsystem = LSystem(axiom: "F", rules: [
        LSRule(A: "F", B: "FX"),
        LSRule(A: "X", B: "XXFX")
    ])
    
    static var previews: some View {
        TabView {
            LSystemSettingsView()
        }.environmentObject(lsystem)
    }
}
#endif
