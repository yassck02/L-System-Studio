//
//  SceneDelegate.swift
//  Spirograhper
//
//  Created by Connor yass on 6/30/19.
//  Copyright © 2019 HSY Tehcnologies. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
//        let turtle = Turtle()
//
//        let vc = UIViewController()
//
//        let turtleView = TurtleView()
//        turtleView.turtle = turtle
//        turtleView.render(sentance: "F+F--F+F+F+F--F+F--F+F--F+F+F+F--F+F")
//        turtleView.setNeedsDisplay()
//
//        vc.view.addSubview(turtleView)
//
//        turtleView.translatesAutoresizingMaskIntoConstraints = false
//        turtleView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor).isActive = true
//        turtleView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor).isActive = true
//        turtleView.topAnchor.constraint(equalTo: vc.view.topAnchor).isActive = true
//        turtleView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor).isActive = true
        
        window!.rootViewController = DocumentBrowserVC()
        window!.makeKeyAndVisible()
    }
}
