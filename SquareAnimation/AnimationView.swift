//
//  SquareView.swift
//  SquareAnimation
//
//  Created by Vladislav Garifulin on 27.02.2021.
//

import Foundation
import UIKit

class AnimationView: UIView {
    var squareLength: CGFloat = 0.0 {
        didSet {
            widthSquareConstraint.constant = squareLength
            heightSquareConstraint.constant = squareLength
        }
    }
    private let squareView = UIView()
    private lazy var widthSquareConstraint = squareView.widthAnchor.constraint(equalToConstant: 0)
    private lazy var heightSquareConstraint = squareView.heightAnchor.constraint(equalToConstant: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initCommon()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initCommon()
    }
    
    func initCommon() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        addSubview(squareView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            squareView.centerXAnchor.constraint(equalTo: centerXAnchor),
            squareView.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthSquareConstraint,
            heightSquareConstraint
        ])
    }
}
