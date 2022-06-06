//
//  ErrorController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 16.5.21..
//  Copyright © 2021 RedCellApps. All rights reserved.
//


import UIKit

extension UIViewController {
    func showError(errorTitle: String, errorDesc: String){
        let wedFlowError = UIAlertController(title: errorTitle, message: errorDesc, preferredStyle: .alert)
        wedFlowError.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Dismiss"), style: .default, handler: { _ in
        NSLog(errorTitle)
        NSLog(errorDesc)
        }))
        self.present(wedFlowError, animated: true, completion: nil)
    }
}
