//
//  Spinner.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 26.4.21..
//  Copyright © 2021 RedCellApps. All rights reserved.
//

import UIKit

fileprivate var aView : UIView?

extension UIViewController {
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(patternImage: UIImage(named: "background.png")!) 
//        aView?.backgroundColor = UIColor.init (red: 0.5, green: 0.5, blue: 0.5, alpha: 0.7)

        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
    
}
