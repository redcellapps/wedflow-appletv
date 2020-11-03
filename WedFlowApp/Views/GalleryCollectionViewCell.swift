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
    @IBOutlet weak var galleryType: UILabel!
    @IBOutlet weak var galleryTitle: UILabel!
    
    
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
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
        setImageFrame()
        fadeOut()
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if (self.isFocused)
        {
            self.gradient.removeFromSuperlayer()
            self.galleryImage.adjustsImageWhenAncestorFocused = true
        }
        else
        {
            fadeOut()
            self.galleryImage.adjustsImageWhenAncestorFocused = false
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        setImageFrame()
        fadeOut()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func fadeOut(){
        let gradientView = UIView (frame: galleryImage.frame)
        gradientView.layer.insertSublayer(gradient, at: 1)
        galleryImage.addSubview(gradientView)
    }
    
    func setImageFrame(){
        galleryImage.layer.masksToBounds = true
        galleryImage.layer.cornerRadius = 8
        galleryImage.layer.borderWidth = 1
        galleryImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
