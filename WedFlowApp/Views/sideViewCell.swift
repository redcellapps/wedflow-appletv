//
//  SideViewCell.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import Foundation
import UIKit


class SideMenuCell: UITableViewCell {
    

    @IBOutlet weak var sideMenuView: UIView!
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func commonInit()
    {
        // Initialization code
        //        fadeOut()
        setCellFrame()
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
//        super.didUpdateFocus(in: context, with: coordinator)
//        if context.nextFocusedView == self {
//
//             coordinator.addCoordinatedAnimations({
//                UIView.animate(withDuration: UIView.inheritedAnimationDuration * 2) {
//                    self.sideMenuView.backgroundColor = UIColor(hexString:"CFA75C")
//               }
//             }, completion: nil)
//         } else if context.previouslyFocusedView == self {
//
//             coordinator.addCoordinatedAnimations({
//                UIView.animate(withDuration: UIView.inheritedAnimationDuration * 2) {
//                    self.sideMenuView.backgroundColor = UIColor(hexString:"404040")
//               }
//             }, completion: nil)
//         }
        if (self.isFocused)
        {
            sideMenuView.layer.backgroundColor = UIColor(hexString:"CFA75C").cgColor
        }
        else
        {
            sideMenuView.layer.backgroundColor = UIColor(hexString:"404040").cgColor
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        setCellFrame()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //sideMenuView.backgroundColor = UIColor(hexString:"404040")
        //setCellFrame()
    }
    
    func setCellFrame(){
        sideMenuView.layer.masksToBounds = true
        sideMenuView.layer.cornerRadius = 10
        //sideMenuView.layer.borderWidth = 2
        //sideMenuView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75).cgColor
    }
    
}

