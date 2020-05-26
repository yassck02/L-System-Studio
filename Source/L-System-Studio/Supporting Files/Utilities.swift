//
//  Utilities.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/7/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

import UIKit

@discardableResult
func share(items: [Any], excludedActivityTypes: [UIActivity.ActivityType]? = nil ) -> Bool {
    guard let source = UIApplication.shared.windows.last?.rootViewController else {
        return false
    }
    
    let vc = UIActivityViewController(
        activityItems: items,
        applicationActivities: nil
    )
    
    vc.excludedActivityTypes = excludedActivityTypes
    vc.popoverPresentationController?.sourceView = source.view
    source.present(vc, animated: true)
    return true
}
