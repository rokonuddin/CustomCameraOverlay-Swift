//
//  CustomOverLay.swift
//  CustomCamera
//
//  Created by Rokon Uddin on 1/29/17.
//  Copyright © 2017 Rokon Uddin. All rights reserved.
//

import UIKit

class CustomOverlayView: UIView {
    @IBOutlet weak var captureButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        captureButton.layer.cornerRadius = 32.0
        captureButton.layer.borderColor = UIColor.red.cgColor
        captureButton.layer.borderWidth = 4.0
        captureButton.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)?[0] as! UIView
        view.frame = UIScreen.main.bounds
        addSubview(view)
    }
    

//   class func instanceFromNib() -> UIView {
//        return UINib(nibName: "CustomOverlayView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
//    }
}
