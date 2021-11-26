//
//  MultiVideoCell.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 06/10/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit

class MultiVideoCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackground: UIImageView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var albumContentView: UIView!
    
    var tmpBounds: CGRect!
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.bounds
        return gradientLayer
    }()

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func commonInit()
    {
        // Initialization code
        fadeOut()
        setImageFrame()
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        if context.nextFocusedView == self {
            
             coordinator.addCoordinatedAnimations({
                UIView.animate(withDuration: UIView.inheritedAnimationDuration / 2) {
                    //self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
                    //self.fadeOut()
                    self.tmpBounds = self.cellBackground.bounds
                    self.cellBackground.bounds = self.albumContentView.bounds
                                //self.gradient.removeFromSuperlayer()
                    self.titleView.bounds = self.albumContentView.bounds
                    self.cellBackground.adjustsImageWhenAncestorFocused = false
               }
             }, completion: nil)
         } else if context.previouslyFocusedView == self {
           
             coordinator.addCoordinatedAnimations({
                UIView.animate(withDuration: UIView.inheritedAnimationDuration * 3) {
                    //self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
                    //self.fadeOut()
                    self.cellBackground.bounds = self.tmpBounds
                    self.titleView.bounds = self.tmpBounds
                    self.cellBackground.adjustsImageWhenAncestorFocused = false
               }
             }, completion: nil)
         }
        
        
        
        
//        if (self.isFocused)
//        {
//            self.gradient.removeFromSuperlayer()
//            self.cellBackGround.adjustsImageWhenAncestorFocused = true
//        }
//        else
//        {
//            fadeOut()
//            self.cellBackGround.adjustsImageWhenAncestorFocused = false
//        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        fadeOut()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func fadeOut(){
        let gradientView = UIView (frame: cellBackground.frame)
        gradientView.layer.insertSublayer(gradient, at: 1)
        gradientView.layer.masksToBounds = true
        gradientView.layer.cornerRadius = 10
        //gradientView.layer.borderWidth = 1
        //gradientView.layer.borderColor = UIColor.lightGray.cgColor
        cellBackground.addSubview(gradientView)
    }
    
    func setImageFrame(){
        cellBackground.layer.masksToBounds = true
        cellBackground.layer.cornerRadius = 10
        cellBackground.layer.borderWidth = 1
        cellBackground.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
}
