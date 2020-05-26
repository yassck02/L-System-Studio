//
//  CBGradientPicker.swift
//  ColorTools-Demo
//
//  Created by Connor yass on 4/3/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import SwiftUI

struct PointedRectangle: Shape {
    
    var pointerHeight: CGFloat = 15
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY - pointerHeight))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}

// MARK: -

struct CBGradientKeyView: View {
    
    @ObservedObject var color: CBColor
    
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            PointedRectangle()
                .fill(isSelected ? color.swiftUIColor : Color.white)
                .shadow(radius: 30)
                .frame(width: 35, height: 35, alignment: .center)
            CBColorWell(value: self.color)
                .frame(width: 30, height: 30, alignment: .center)
                .cornerRadius(6.0)
        }
    }
}

// MARK: -

struct CBGradientPicker: View {
    
    @ObservedObject var value: CBGradient
    
    @ObservedObject var color: CBColor = .pink
    
    @State var selectedKey: CBGradient.Key? = nil
    
    let colopPickerConfig = CBColorPickerConfig(showColorPreview: false)
    
    var body: some View {
        VStack {
            VStack {
                LinearGradient(gradient: value.swiftUIGradient, startPoint: .leading, endPoint: .trailing)
                    .cornerRadius(6.0)
                    .frame(height: 75.0)
                    
                GeometryReader { geometry in
                    ForEach(self.value.sortedKeys.indices) { i in
                        CBGradientKeyView(color: self.value.sortedKeys[i].color)
                            .position(x: geometry.size.width * CGFloat(self.value.sortedKeys[i].location),
                                      y: geometry.size.height / 2.0)
                            .onTapGesture {
                                self.selectedKey = self.value.sortedKeys[i]
                        }
                    }
                }
                .frame(height: 50.0)
            }
            Divider()
            CBColorPicker(value: color, config: colopPickerConfig)
        }
    }
    
    private func addKey(color: CBColor, location: Float) {
        value.insert(color: color, at: location)
    }
    
    private func removeKey(at index: Int) {
        value.removeKeyframe(at: index)
    }
}

#if DEBUG
struct CBGradientPicker_Previews: PreviewProvider {
    
    @State static var gradient = CBGradient.sunrise
    
    static var previews: some View {
        CBGradientPicker(value: gradient)
            .padding()
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
#endif
