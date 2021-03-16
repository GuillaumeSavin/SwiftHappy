//
//  HappinessViewController.swift
//  Happy
//
//  Created by Savin Guillaume on 07/03/2021.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource, UIPopoverPresentationControllerDelegate {
    
    func smilinessForFaceView(sender: FaceView) -> CGFloat? {
        return CGFloat(allegresse - 50) / 50
    }
    
    private let defaults = UserDefaults.standard
    
    var histoireDesRéponses : [Int] {
        get {
            return defaults.object(forKey: "HistoriqueHappiness") as? [Int] ?? []
        }
        set {
            defaults.setValue(newValue, forKey: "HistoriqueHappiness")
        }
    }
    
    //entre 0 = pas content et 100 = hyper content
    var allegresse : Int = 50 {
        didSet {
            allegresse = min(max(allegresse, 0), 100)
            print("allegresse = \(allegresse)")
            histoireDesRéponses += [allegresse]
            updateUI()
            
        }
    }
    
    func updateUI() {
        title = "Happiness = \(allegresse)"
        faceView?.setNeedsDisplay()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        case .ended : allegresse += Int(gesture.translation(in: faceView).y / 9)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showHistory":
                if let tvc = segue.destination as? TextViewController {
                    tvc.histoire += "\(histoireDesRéponses)"
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                }
            default:
                break
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    @IBAction func clear(_ sender: UIButton) {
        histoireDesRéponses = []
    }
}
