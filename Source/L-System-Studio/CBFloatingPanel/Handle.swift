//
//  Handle.swift
//  L-System-Studio
//
//  Created by Connor yass on 4/11/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

struct Handle: View {
    
    @State var isSeleected: Bool = false
    
    @State var size = CGSize(width: 35, height: 5)
    
    @State var color: Color = Color(hue: 0, saturation: 0, brightness: 0, opacity: 0.2)
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            RoundedRectangle(cornerRadius: size.height/2.0)
                .foregroundColor(color)
                .frame(width: size.width, height: size.height, alignment: .center)
                .padding(8.0)
            Divider()
                .padding(0)
        }
    }
}

#if DEBUG
struct Handle_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Handle()
            Spacer()
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
#endif
