//
//  ShapeAnimationView.swift
//  SquareAnimation
//
//  Created by Vladislav Garifulin on 28.02.2021.
//

import Foundation
import UIKit

class ShapeView: UIView {
    let shapeLayer = CAShapeLayer()
    var squareLength: CGFloat! {
        didSet {
            shapeLayer.path = UIBezierPath(rect: CGRect(x: (bounds.size.width - squareLength) / 2.0, y: (bounds.size.height - squareLength) / 2.0,
                width: squareLength, height: squareLength)).cgPath
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initCommon()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initCommon()
    }
    
    func initCommon() {
        shapeLayer.fillColor = UIColor.green.cgColor
        layer.addSublayer(shapeLayer)
    }    
}
