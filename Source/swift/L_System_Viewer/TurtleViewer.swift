//
//  Turtle.swift
//  L_System_Viewer
//
//  Created by Connor yass on 2/28/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

import Foundation
import Cocoa

/* ----------------------------------------------------------------------------------------- */
// MARK: 🐢🖥🖍

class TurtleViewer : NSView {
	
	@objc dynamic var percent =		Double()
	
	@objc dynamic var leftAngle =	Double(90.0)
	var leftAngleFactor =			Double(0.0)
	var leftAngleFactorEnabled =	Bool(false);
	
	@objc dynamic var rightAngle =	Double(90.0)
	var rightAngleFactor =			Double(0.0)
	var rightAngleFactorEnabled =	Bool(false)
	
	@objc dynamic var lineLength =	Double(100.0)
	var lineLenghtFactor =			Double(0.0)
	var lengthFactorEnabled =		Bool(false)
	
	@objc dynamic var lineThickness =	Double(2.0)
	var lineThicknessFactor =		Double(0.0)
	var ThicknessFactorEnabled =	Bool(false)
	
	var states =					[turlteState]()
	
	var rainbow =					Bool(false)
	var drawColor =					NSColor.red
	@objc dynamic var backgroundColor =	NSColor.black {
		didSet {
			self.setNeedsDisplay(bounds)
		}
	}
	
	var sentance = ""
	
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
        
        NSGraphicsContext.saveGraphicsState()
		
		backgroundColor.set()
		NSBezierPath.fill(bounds)
		
		states = []
		
		var currentPos = startPos
		var previousPos = startPos
		var currentAngle: Double = 0.0
		var currentLineLength = lineLength
		var currentLineThickness = lineThickness
		var currentLeftAngle = leftAngle
		var currentRightAngle = rightAngle
		
		drawColor.setStroke()
		NSBezierPath.defaultLineCapStyle = NSBezierPath.LineCapStyle.roundLineCapStyle
		NSBezierPath.defaultLineJoinStyle = NSBezierPath.LineJoinStyle.roundLineJoinStyle
		
		let x = Double(sentance.count) * percent
		let count = Int(x.rounded())
		
		for (index, char) in sentance.enumerated() {		//loop through each cahracter in the sentance
			
			if(index > count){ break; }
			
			switch(char){
				
			case "F": //move forward and draw a line
				
				currentPos.x += CGFloat(cos(currentAngle * Double.pi / 180.0) * currentLineLength)
				currentPos.y += CGFloat(sin(currentAngle * Double.pi / 180.0) * currentLineLength)
		
				if(rainbow) {
					NSGraphicsContext.saveGraphicsState()
					let color = getRainbowColor(i: Double(index), max: Double(sentance.count))
					color.setStroke()
					NSGraphicsContext.restoreGraphicsState()
				} else {
					NSBezierPath.defaultLineWidth = CGFloat(currentLineThickness)
					NSBezierPath.strokeLine(from: previousPos, to: currentPos)
					drawColor.setStroke()
				}
		
				previousPos = currentPos;
				break;
				
			case "f": //move forward w/o drawing a line
				
				currentPos.x += CGFloat(cos(currentAngle * Double.pi / 180.0) * currentLineLength)
				currentPos.y += CGFloat(sin(currentAngle * Double.pi / 180.0) * currentLineLength)
				break;
				
			case "+": //rotate left
				
				currentAngle -= leftAngle
				break;
				
			case "-": //rotate right
				
				currentAngle += rightAngle
				break;
				
			case "[": //save state
				
				var currentState = turlteState()
				currentState.location = currentPos
				currentState.leftAngle = currentLeftAngle
				currentState.currentAngle = currentAngle
				currentState.rightAngle = currentRightAngle
				currentState.lineLength = currentLineLength
				currentState.lineThickness = currentLineThickness
				states += [currentState]
				break;
				
			case "]": //return to last saved state
				
				let updatedState = states.popLast()!
				previousPos = updatedState.location;
				currentPos = previousPos
				currentLeftAngle = updatedState.leftAngle
				currentRightAngle = updatedState.rightAngle
				currentAngle = updatedState.currentAngle
				currentLineLength = updatedState.lineLength
				currentLineThickness = updatedState.lineThickness
				break;
				
			case "!": //left angle factor
				
				if(leftAngleFactorEnabled){
					if(leftAngleFactor > 0){
						currentLeftAngle *= abs(1+leftAngleFactor)
					} else {
						currentLeftAngle *= (1 - abs(leftAngleFactor))
					}
				}
				break;
				
			case "@": //right angle factor
				
				if(rightAngleFactorEnabled){
					if(rightAngleFactor > 0){
						currentRightAngle *= abs(1+rightAngleFactor)
					} else {
						currentRightAngle *= (1 - abs(rightAngleFactor))
					}
				}
				break;
				
			case "#": //Line length factor
				
				if(lengthFactorEnabled){
					if(lineLenghtFactor > 0){
						currentLineLength *= abs(1+lineLenghtFactor)
					} else {
						currentLineLength *= (1 - abs(lineLenghtFactor))
					}
				}
				break;
				
			case "$": //Line Weight factor
				
				if(ThicknessFactorEnabled){
					if(lineThicknessFactor > 0){
						currentLineThickness *= abs(1+lineThicknessFactor)
					} else {
						currentLineThickness *= (1 - abs(lineThicknessFactor))
					}
				}
				break;
			default:
				break;
			}
		}
        NSGraphicsContext.restoreGraphicsState()
	}
	
	func getRainbowColor(i: Double, max: Double) -> NSColor {
		let h = CGFloat(i/max);
		return NSColor(hue: h, saturation: 1.0, brightness: 1.0, alpha: 1.0)
	}
	
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	var startPos = NSPoint()
	var mouseGridOffset = NSPoint()
	
	override func mouseDragged(with event: NSEvent) {
		let currentMouseLocation = NSEvent.mouseLocation
		startPos = NSPoint(x: currentMouseLocation.x-mouseGridOffset.x, y: currentMouseLocation.y - mouseGridOffset.y)
		self.needsDisplay = true;
	}
	
	override func mouseDown(with event: NSEvent) {
		let mouseDownPosition =  NSEvent.mouseLocation
		let offsetX = mouseDownPosition.x - startPos.x
		let offsetY = mouseDownPosition.y - startPos.y
		mouseGridOffset = NSPoint(x: offsetX, y:offsetY)
	}
	
	override func mouseUp(with event: NSEvent) {
		mouseGridOffset = NSPoint(x: 0, y: 0)
	}

    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

}

/* ----------------------------------------------------------------------------------------- */
// MARK: 🐢↔️↕️

struct turlteState
{
	var location = NSPoint()
	var leftAngle = Double()
	var currentAngle = Double()
	var rightAngle = Double()
	var lineLength = Double()
	var lineThickness = Double()
}

/* ----------------------------------------------------------------------------------------- */
