//
//  HappinessViewController.swift
//  Happy
//
//  Created by Savin Guillaume on 07/03/2021.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    func smilinessForFaceView(sender: FaceView) -> CGFloat? {
        return CGFloat(allegresse - 50) / 50
    }
    
    
    //entre 0 = pas content et 100 = hyper content
    var allegresse : Int = 50 {
        didSet {
            allegresse = min(max(allegresse, 0), 100)
            print("allegresse = \(allegresse)")
            updateUI()
            
        }
    }
    
    func updateUI() {
        title = "Happiness = \(allegresse)"
        faceView?.setNeedsDisplay()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector (faceView.scale(gesture: ))))
            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.changeHappiness(gesture:))))
        }
    }

    @objc func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed : fallthrough
        case .ended : allegresse += Int(gesture.translation(in: faceView).y / 6)
        default:
            break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
