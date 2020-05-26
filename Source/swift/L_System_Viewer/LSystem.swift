//
//  L_System.swift
//  L_System_Viewer
//
//  Created by Connor yass on 2/27/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

import Foundation

/* ----------------------------------------------------------------------------------------- */
// MARK: 📝

class Rule: NSObject {
	@objc dynamic var a: String = " "
	@objc dynamic var b: String = " "
}

/* ----------------------------------------------------------------------------------------- */

class LSystem: NSObject {
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
	
	@objc dynamic var axiom: String = "X"
	
	@objc dynamic var sentance: String = "X+YF++YF-FX--FXFX-YF+"
	
	@objc dynamic var characterCount: Int {
		get {
			return sentance.count
		}
	}
	
	@objc dynamic var itterationCount: Int = 0
	
	@objc dynamic var rules = [Rule]()
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
    // MARK: Init
	
	override init(){
		let temp1 = Rule()
		temp1.a = "X"
		temp1.b = "X+YF++YF-FX--FXFX-YF+"
		rules += [temp1]
		let temp2 = Rule()
		temp2.a = "Y"
		temp2.b = "-FX+YFYF++YF+FX--FX-Y"
		rules += [temp2]
	}
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
	
	func iterate()
    {
		itterationCount += 1;
		generatePermutation(count: itterationCount)
	}
	
	func deIterate()
    {
		itterationCount -= 1;
		if(itterationCount < 0) { itterationCount = 0 }
		generatePermutation(count: itterationCount)
	}
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
	
	func generatePermutation(count: Int)
    {
		sentance = axiom
		var tempSentance = String()
		
		for _ in 0..<count{
			tempSentance = ""
			for i in 0..<sentance.count {
				var found: Bool = false;
				for rule in rules {
                    let index = sentance.index(sentance.startIndex, offsetBy: i)
					if(sentance[index] == rule.a.first!){
						tempSentance += rule.b
						found = true
						break
					}
				}
				if(!found){ tempSentance += String(i) }
			}
			sentance = tempSentance
		}
	}
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	func reset(axiom: String, rules: [Rule])
    {
		self.axiom = axiom
		self.itterationCount = 0
		self.rules = rules
	}
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
    
}

/* ----------------------------------------------------------------------------------------- */
