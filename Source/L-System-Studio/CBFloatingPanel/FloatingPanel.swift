//
//  CBPanel.swift
//  L-System-Studio
//
//  Created by Connor yass on 4/11/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

struct FloatingPanel<Content: View>: View {
    
    @State private var dragged = CGSize.zero
    @State private var accumulated = CGSize.zero
    
    @State var size = CGSize(width: 300, height: 400)
    
    var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            Handle()
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: size.width, height: size.height)
        .border(Color.gray)
        .offset(dragged)
//        .gesture(DragGesture()
//            .onChanged {
//                self.dragged = CGSize(
//                    width: $0.translation.width + self.accumulated.width,
//                    height: $0.translation.height + self.accumulated.height
//                )
//        }
//        .onEnded {
//            self.dragged = CGSize(
//                width: $0.translation.width + self.accumulated.width,
//                height: $0.translation.height + self.accumulated.height
//            )
//            self.accumulated = self.dragged
//        })
        .background(Color.white)
    }
}

#if DEBUG
struct FloatingPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        FloatingPanel {
            Text("test")
        }
    }
}
#endif
