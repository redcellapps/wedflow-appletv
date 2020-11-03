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
        if (self.isFocused)
        {
            self.gradient.removeFromSuperlayer()
            self.cellBackground.adjustsImageWhenAncestorFocused = true
        }
        else
        {
            fadeOut()
            self.cellBackground.adjustsImageWhenAncestorFocused = false
        }
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
        cellBackground.addSubview(gradientView)
    }
    
    func setImageFrame(){
        cellBackground.layer.masksToBounds = true
        cellBackground.layer.cornerRadius = 8
        cellBackground.layer.borderWidth = 1
        cellBackground.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
