//
//  DocumentBrowserViewController.swift
//  test
//
//  Created by Connor yass on 7/17/19.
//  Copyright © 2019 HSY Tehcnologies. All rights reserved.
//

import UIKit
import SwiftUI

class DocumentBrowserVC: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        allowsDocumentCreation = true
        allowsPickingMultipleItems = false
    }
    
    // MARK: UIDocumentBrowserViewControllerDelegate
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void) {
        let newDocumentURL: URL? = Bundle.main.url(forResource: "blank", withExtension: "Lsystem")
        
        if newDocumentURL != nil {
            importHandler(newDocumentURL, .copy)
        } else {
            importHandler(nil, .none)
        }
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
        guard let sourceURL = documentURLs.first else { return }
        presentDocument(at: sourceURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
        presentDocument(at: destinationURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
        let alert = UIAlertController(title: "Could not import document", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    // MARK: Document Presentation
    
    func presentDocument(at documentURL: URL) {
        let document = Document(fileURL: documentURL)

        document.open(completionHandler: { success in
            if success {
                let vc = DocumentVC(document: document)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Could not import document", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true)
            }
        })
    }
}
