//
//  UIHelpers.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 16.5.21..
//  Copyright © 2021 RedCellApps. All rights reserved.
//

import UIKit

extension UIViewController {
    func addOverlay(toView: UIView, color: UIColor, opacity: Float){
        let overlayView = UIView (frame: toView.frame)
        overlayView.backgroundColor = color
        overlayView.layer.opacity = opacity
        toView.addSubview(overlayView)
    }
}
