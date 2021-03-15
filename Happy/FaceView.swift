//
//  FaceView.swift
//  Happy
//
//  Created by Savin Guillaume on 07/03/2021.
//

import UIKit

protocol  FaceViewDataSource : class {
    func smilinessForFaceView(sender: FaceView) -> CGFloat?
}

@IBDesignable
class FaceView: UIView {
    
    weak var dataSource : FaceViewDataSource?

    var faceCenter : CGPoint {
        get {
            return convert(center, from: superview)
        }
    }
    
    var oeilG_Center : CGPoint {
        get {
            return CGPoint(x: faceCenter.x - 0.5 * faceRadius, y: faceCenter.y - 0.3 * faceRadius)
        }
    }
    
    var oeilD_Center : CGPoint {
        get {
            return CGPoint(x: faceCenter.x + 0.5 * faceRadius, y: faceCenter.y - 0.3 * faceRadius)
        }
    }
    
    var coinBoucheG : CGPoint {
        get {
            return CGPoint(x: oeilG_Center.x, y: faceCenter.y + 0.3 * faceRadius)
        }
    }
    
    var coinBoucheD : CGPoint {
        get {
            return CGPoint(x: oeilD_Center.x, y: faceCenter.y + 0.3 * faceRadius)
        }
    }
    
    var faceRadius : CGFloat {
        return scaling * (min(bounds.size.height, bounds.size.width) / 2)
    }
    
    var yeuxRadius : CGFloat {
        return scaling * (min(bounds.size.height, bounds.size.width) / 2) * 0.15
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
        
        let oeilG = UIBezierPath(arcCenter: oeilG_Center, radius: yeuxRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let oeilD = UIBezierPath(arcCenter: oeilD_Center, radius: yeuxRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let happiness : CGFloat? = dataSource?.smilinessForFaceView(sender: self)
        
        var basBoucheG : CGPoint {
            get {
                return CGPoint(x: faceCenter.x - 0.25 * faceRadius, y: (faceCenter.y + 0.3 * faceRadius) + (0.3 * happiness! * faceRadius) )
            }
        }
        
        var basBoucheD : CGPoint {
            get {
                return CGPoint(x: faceCenter.x + 0.25 * faceRadius, y: (faceCenter.y + 0.3 * faceRadius) + (0.3 * happiness! * faceRadius))
            }
        }
        
        let bouche = UIBezierPath()
        
        bouche.move(to: coinBoucheG)
        bouche.addCurve(to: coinBoucheD, controlPoint1: basBoucheG, controlPoint2: basBoucheD)
        
        
        
        
        visage.lineWidth = lineWidth
        oeilG.lineWidth = lineWidth
        oeilD.lineWidth = lineWidth
        bouche.lineWidth = lineWidth
        
        faceColor.set()
        
        visage.stroke()
        oeilG.stroke()
        oeilD.stroke()
        bouche.stroke()        
    }
    
    @objc func scale(gesture: UIPinchGestureRecognizer) {
        scaling *= gesture.scale
        gesture.scale = 1
    }
    

}
