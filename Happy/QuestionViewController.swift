//
//  QuestionViewController.swift
//  Happy
//
//  Created by Guillaume Savin on 15/03/2021.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rien(_ sender: Any) {
        performSegue(withIdentifier: "rien", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navCon = segue.destination as? UINavigationController {
            if let hvc = navCon.visibleViewController as? HappinessViewController {
                if let identifier = segue.identifier {
                    switch identifier {
                    case "Cool":
                        hvc.allegresse = 100
                    case "Bof":
                        hvc.allegresse = 50
                    case "Nul":
                        hvc.allegresse = 0
                    case "rien":
                        hvc.allegresse = 30
                    default:
                        break
                    }
                }
            }
        }
    }
    

}
