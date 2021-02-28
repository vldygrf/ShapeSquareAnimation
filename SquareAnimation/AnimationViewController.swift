//
//  ViewController.swift
//  SquareAnimation
//
//  Created by Vladislav Garifulin on 28.02.2021.
//

import UIKit

class AnimationViewController: UIViewController {
    private enum Settings {
        static let squareLengthStart: CGFloat = 100
        static let squareLengthEnd: CGFloat = squareLengthStart * 2.0
        static let animationDuration: TimeInterval = 3.0
    }
    
    private var displayLink: CADisplayLink!
    private var startTime: CFAbsoluteTime!
    
    override func loadView() {
        view = ShapeView()
    }
    
    func view() -> ShapeView {
        return view as! ShapeView
    }
    
    private func startAnimation() {
        startTime = CFAbsoluteTimeGetCurrent()
        displayLink = CADisplayLink(target: self, selector: #selector(animate))
        displayLink.add(to: .current, forMode: RunLoop.Mode.default)
    }
    
    private func stopAnimation() {
        displayLink.invalidate()
        displayLink = nil
    }
    
    @objc private func animate(displayLink: CADisplayLink) {
        let elapsed = CFAbsoluteTimeGetCurrent() - startTime
        let percent = CGFloat(elapsed) / CGFloat(Settings.animationDuration)
        
        view().squareLength = Settings.squareLengthStart + (Settings.squareLengthEnd - Settings.squareLengthStart) * percent
        
        if (percent >= 1.0) {
            stopAnimation()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimation()
    }
}

