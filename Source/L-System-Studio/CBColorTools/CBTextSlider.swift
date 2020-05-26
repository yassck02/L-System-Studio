//
//  ContentView.swift
//  ColorTools-Demo
//
//  Created by Connor yass on 3/27/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

/// A slider and a text field that can be used to input a numeric value.
/// The text in the text field and the slider are kept in sync
struct CBTextSlider: View {
    
    @Binding public var value: Float
    
    @State private var text: String = ""
    
    @State public var title: String
    
    var onChanged: (() -> Void)?
    
    @State public var maximum: Float = 1.0 {
        didSet {
            formatter.maximum = NSNumber(value: maximum)
        }
    }
    
    @State public var minimum: Float = 0.0 {
        didSet {
            formatter.maximum = NSNumber(value: minimum)
        }
    }
    
    public var formatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.formatWidth = 3
        return formatter
    }()
    
    var body: some View {
        HStack(spacing: 12.0) {
            Text(title)
                .frame(width: 75, alignment: .leading)
            Slider(value: $value) { b in
                print(b)
                self.onChanged?()
            }
            TextField("0.5", value: $text, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 75, height: nil, alignment: .center)
        }
    }
}

#if DEBUG
struct CBSliderTextView_Previews: PreviewProvider {
    
    @State static var value: Float = 0.5
    
    static var previews: some View {
        CBTextSlider(value: $value, title: "Title")
            .previewLayout(.fixed(width: 500, height: 50))
            .accentColor(.gray)
            .padding()
    }
}
#endif
