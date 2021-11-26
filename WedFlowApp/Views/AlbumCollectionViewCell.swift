//
//  galleryCollectionViewCell.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 29/06/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackground: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var videoLabelView: UIView!
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
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        if context.nextFocusedView == self {
            
             coordinator.addCoordinatedAnimations({
                UIView.animate(withDuration: UIView.inheritedAnimationDuration / 2) {
                    self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
                    self.fadeOut()
                    self.tmpBounds = self.cellBackground.bounds
                    self.cellBackground.bounds = self.albumContentView.bounds
                    self.videoLabelView.bounds = self.albumContentView.bounds
                                //self.gradient.removeFromSuperlayer()
                    self.cellBackground.adjustsImageWhenAncestorFocused = false
               }
             }, completion: nil)
         } else if context.previouslyFocusedView == self {
           
             coordinator.addCoordinatedAnimations({
                UIView.animate(withDuration: UIView.inheritedAnimationDuration * 3) {
                    self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
                    self.fadeOut()
                    self.cellBackground.bounds = self.tmpBounds
                    self.videoLabelView.bounds = self.tmpBounds
                    self.cellBackground.adjustsImageWhenAncestorFocused = false
               }
             }, completion: nil)
         }
//        if (self.isFocused)
//        {
//            //self.gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
//            self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
//            fadeOut()
//            self.tmpBounds = self.cellBackground.bounds
//            self.cellBackground.bounds = self.albumContentView.bounds
//            self.videoLabelView.bounds = self.albumContentView.bounds
//            //self.gradient.removeFromSuperlayer()
//            self.cellBackground.adjustsImageWhenAncestorFocused = false
//        }
//        else
//        {
//            self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        //            fadeOut()
        //            self.cellBackground.bounds = self.tmpBounds
        //            self.videoLabelView.bounds = self.tmpBounds
        //            self.cellBackground.adjustsImageWhenAncestorFocused = false
//        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fadeOut()
        setImageFrame()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func fadeOut(){
        let gradientView = UIView (frame: albumContentView.frame)
        gradientView.layer.insertSublayer(gradient, at: 1)
        cellBackground.addSubview(gradientView)
    }
    
    func setImageFrame(){
        cellBackground.layer.masksToBounds = true
        cellBackground.layer.cornerRadius = 10
        cellBackground.layer.borderWidth = 1
        cellBackground.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
