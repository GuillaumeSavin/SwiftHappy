//
//  FaceView.swift
//  Happy
//
//  Created by Savin Guillaume on 07/03/2021.
//

import UIKit

@IBDesignable
class FaceView: UIView {

    var faceCenter : CGPoint {
        get {
            return convert(center, from: superview)
        }
    }
    
    var faceRadius : CGFloat {
        return scaling * (min(bounds.size.height, bounds.size.width) / 2)
    }
    
    @IBInspectable
    var lineWidth : CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var faceColor : UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var scaling : CGFloat = 0.9 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let visage = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        visage.lineWidth = lineWidth
        
        faceColor.set()
        
        visage.stroke()
        
    }
    
    @objc func scale(gesture: UIPinchGestureRecognizer) {
        scaling *= gesture.scale
        gesture.scale = 1
    }
    

}
