//
//  ConfigView.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/5/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

struct DocumentPropertiesView: View {
    
    @EnvironmentObject var properties: DocumentProperties
        
    private var shareButton: some View {
        AnyView(
            Button(action: {
                print("share")
            }, label: {
               Image(systemName: "square.and.arrow.up")
            })
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance")) {
                    HStack {
                        Text("Background")
                        Spacer()
                        CBColorWell(value: properties.backgroundColor)
                            .frame(width: 150)
                    }
                    HStack {
                        Text("Stroke")
                        Spacer()
                        CBGradientWell(value: properties.strokeGradient)
                            .frame(width: 150)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Document", displayMode: .inline)
            .navigationBarItems(trailing: shareButton)
        }
        .tabItem {
            Image(systemName: "doc")
            Text("Doc")
        }
    }
}

#if DEBUG
struct DocumentPropertiesView_Previews: PreviewProvider {
    
    static let properties = DocumentProperties(backgroundColor: .purple, strokeGradient: .sunset)
    
    static var previews: some View {
        TabView {
            DocumentPropertiesView()
        }.environmentObject(properties)
    }
}
#endif
