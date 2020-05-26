//
//  DrawViewController.swift
//  L_System_Viewer
//
//  Created by Connor yass on 2/26/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

import Cocoa

/* ----------------------------------------------------------------------------------------- */

class Preset: NSObject
{
	@objc dynamic var name:				String	= "Unknown"
	@objc dynamic var axiom:			String	= "X"
	@objc dynamic var rules:			String	= "X > XF"
	@objc dynamic var leftAngle:		Double	= 90.0
	@objc dynamic var leftFactor:		Double	= 1.0
	@objc dynamic var rightAngle:		Double	= 90.0
	@objc dynamic var rightFactor:		Double	= 1.0
	@objc dynamic var angleLock:		Int32	= 1
	@objc dynamic var lineWidth:		Double	= 5.0
	@objc dynamic var widthFactor:		Double	= 1.0
	@objc dynamic var lineLength:		Double	= 50.0
	@objc dynamic var lengthFactor:		Double	= 1.0
}

/* ----------------------------------------------------------------------------------------- */

class MainVC: NSViewController {
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	@objc dynamic var LS = LSystem();
	@IBOutlet dynamic weak var turtle: TurtleViewer!
	
	@IBOutlet var rulesArrayControler: NSArrayController!
	@IBOutlet weak var rulesTable: NSTableView!
	
	@objc dynamic var autoupdate = true
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	@IBAction func addRule(_ sender: Any) {
		LS.rules += [Rule()]
		rulesArrayControler.content = LS.rules
		rulesTable.reloadData()
		if autoupdate { manualRender() }
	}
	@IBAction func deleteRule(_ sender: Any) {
		rulesArrayControler.content = LS.rules
		rulesTable.reloadData()
		if autoupdate { manualRender() }
	}
	
	@IBAction func render(_ sender: Any) {
		turtle.sentance = LS.sentance
		if autoupdate { turtle.display() }
	}

	@IBAction func stepUp(_ sender: Any) {
		LS.iterate()
		if autoupdate { manualRender() }
	}
	
	@IBAction func stepDown(_ sender: Any) {
		LS.deIterate()
		if autoupdate { manualRender() }
	}
	
	func manualRender() {
		turtle.sentance = LS.sentance
		if autoupdate { turtle.display() }
	}

    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
    // MARK: Init
    
	override func viewDidLoad(){
		super.viewDidLoad()
		rulesArrayControler.content = LS.rules
		rulesTable.reloadData()
		turtle.display()
	}
	
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

    @IBOutlet weak var check_lineLength: NSButton!
    @IBOutlet weak var check_lineThickness: NSButton!
    @IBOutlet weak var check_leftAngle: NSButton!
    @IBOutlet weak var check_rightAngle: NSButton!

    @IBOutlet weak var slider_value: NSSlider!
    @IBOutlet weak var slider_factor: NSSlider!
    
    @IBOutlet weak var check_factor: NSButton!
    
    @IBAction func slider_value_moved(_ sender: Any) {
        if(check_lineLength.state == .on){
            turtle.lineLength = Double(slider_value.floatValue)
        }
        if(check_lineThickness.state == .on){
            turtle.lineThickness = Double(slider_value.floatValue)
        }
        if(check_leftAngle.state == .on){
            turtle.leftAngle = Double(slider_value.floatValue)
        }
        if(check_rightAngle.state == .on){
            turtle.rightAngle = Double(slider_value.floatValue)
        }
    }
    
    @IBAction func slider_factor_moved(_ sender: Any) {
        
    }
    
    @IBAction func check_factor_switched(_ sender: Any) {
        
    }
    
    
    /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

}

/* ----------------------------------------------------------------------------------------- */




