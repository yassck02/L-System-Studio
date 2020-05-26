//
//  AppDelegate.swift
//  L-System-Studio
//
//  Created by Connor yass on 8/4/19.
//  Copyright © 2019 HSY Tehcnologies. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let turtle = Turtle(leftRotateAngle: 60, rightRotateAngle: 60, moveDistance: 10)
//        let lsystem = LSystem(axiom: "F", rules: [
//            LSRule(A: "F", B: "FF")
//        ])
//        let properties = DocumentProperties(backgroundColor: .white, strokeGradient: .rainbow)
//
//        let payload = DocumentPayload(turtle: turtle, lSystem: lsystem, properties: properties)
//
//        do {
//            let data = try JSONEncoder().encode(payload)
//            print(String(data: data, encoding: .utf8))
//        } catch { }
        
        return true
    }
    
    func application(_ app: UIApplication, open inputURL: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard inputURL.isFileURL else { return false }
        guard let browserVC = window?.rootViewController as? DocumentBrowserVC else { return false }
        
        browserVC.revealDocument(at: inputURL, importIfNeeded: true) { (documentURL, error) in
            if let error = error {
                print("Failed to reveal the document at URL \(inputURL) with error: '\(error)'")
                return
            }
            
            browserVC.presentDocument(at: documentURL!)
        }
        
        return true
    }
}
