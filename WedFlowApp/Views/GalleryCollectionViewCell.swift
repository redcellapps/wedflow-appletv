//
//  galleryCollectionViewCell.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 29/06/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var galleryImage: UIImageView!
    @IBOutlet weak var galleryTitleView: UIView!
    @IBOutlet weak var galleryType: UILabel!
    @IBOutlet weak var galleryTitle: UILabel!
    @IBOutlet weak var galleryContentView: UIView!
    @IBOutlet weak var gradientView: UIView!
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
                UIView.animate(withDuration: UIView.inheritedAnimationDuration) {
                self.tmpBounds = self.galleryImage.bounds
                self.galleryTitleView.bounds = self.galleryContentView.bounds
                self.galleryImage.bounds = self.galleryContentView.bounds
                self.gradientView.bounds = self.galleryContentView.bounds
                self.galleryImage.adjustsImageWhenAncestorFocused = false
                
               }
             }, completion: nil)
         } else if context.previouslyFocusedView == self {
             coordinator.addCoordinatedAnimations({
                UIView.animate(withDuration: UIView.inheritedAnimationDuration) {
                self.galleryImage.bounds = self.tmpBounds
                self.galleryTitleView.bounds = self.tmpBounds
                self.gradientView.bounds = self.tmpBounds
                self.galleryImage.adjustsImageWhenAncestorFocused = false
               }
             }, completion: nil)
         }
//        if (self.isFocused)
//        {
////            self.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
////            fadeOut()
//            self.tmpBounds = self.galleryImage.bounds
//            self.galleryImage.bounds = self.galleryContentView.bounds
//            self.gradientView.bounds = self.galleryContentView.bounds
//            self.galleryTitleView.bounds = self.galleryContentView.bounds
//            self.galleryImage.adjustsImageWhenAncestorFocused = false
//
//        }
//        else
//        {
////            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
////            fadeOut()
//
//            self.galleryImage.adjustsImageWhenAncestorFocused = false
//            self.galleryImage.bounds = self.tmpBounds
//            self.galleryTitleView.bounds = self.tmpBounds
//            self.gradientView.bounds = self.tmpBounds
//        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
//        fadeOut()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImageFrame()
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func fadeOut(){
        galleryImage.layer.addSublayer(gradient)
    }

    func setImageFrame(){
        galleryImage.layer.masksToBounds = true
        galleryImage.layer.cornerRadius = 10
        galleryImage.layer.borderWidth = 1
        galleryImage.layer.borderColor = UIColor.lightGray.cgColor
        gradientView.layer.masksToBounds = true
        gradientView.layer.cornerRadius = 10
    }
}
