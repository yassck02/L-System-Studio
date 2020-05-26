//
//  ViewController.swift
//  L-System-Studio
//
//  Created by Connor yass on 3/17/19.
//  Copyright © 2019 HSY_Technologies. All rights reserved.
//

import UIKit
import SwiftUI
import CBTLogger

class DocumentVC: UIViewController {
    
    // MARK: Variables
    
    private var document: Document
    
    private var engine: LSystemEngine!
    
    private var manager: Manager!
    
    private var turtleView: TurtleView!
    
    // MARK: UI Elements
    
    private var overlayVC: UIViewController!
    
    // MARK: Lifecycle
    
    init(document: Document) {
        self.document = document
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been set")
    }
    
    private func setup() {
        engine = LSystemEngine(lsystem: document.lSystem)
        turtleView = TurtleView(frame: view.bounds, turtle: document.turtle)
        
        manager = Manager(engine: engine, turtleView: turtleView)
        
        addTurtleView()
        addFloatingPanel()
    }
    
    private func addTurtleView() {
        view.addSubview(turtleView)
        
        turtleView.translatesAutoresizingMaskIntoConstraints = false
        turtleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        turtleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        turtleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        turtleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addFloatingPanel() {
        overlayVC = UIHostingController(rootView: FloatingPanel {
            TabView {
                DocumentPropertiesView()
                TurtleSettingsView()
                LSystemSettingsView()
                LiveEditView()
            }
            .environmentObject(self.document.turtle)
            .environmentObject(self.document.lSystem)
            .environmentObject(self.document.properties)
            .environmentObject(self.manager)
        })
        
        addChild(overlayVC)
        view.addSubview(overlayVC.view)
        
        overlayVC.view.translatesAutoresizingMaskIntoConstraints = false
        overlayVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        overlayVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        overlayVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        overlayVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        overlayVC.didMove(toParent: self)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.document.close() { success in
            if success {
                self.dismiss(animated: flag)
            } else {
                print("Close error!")
            }
        }
    }
    
    func onPress_exportImage(_ sender: Any) {
        if let image = turtleView.getImage() {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageExportCompletionHandler(_:didFinishSavingWithError:contextInfo:)), nil)
        } else {
            Log.error("could not get image from turtleView")
            imageExportCompletionHandler(nil, didFinishSavingWithError: NSError(), contextInfo: nil)
        }
    }
    
    @objc func imageExportCompletionHandler(_ image: UIImage?, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer?) {
        var ac: UIAlertController!
        if let error = error {
            ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
        } else {
            ac = UIAlertController(title: "Saved!", message: "The image has been saved to your camera roll", preferredStyle: .alert)
        }
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}
