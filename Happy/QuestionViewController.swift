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

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hvc = segue.destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "cool":
                    hvc.allegresse = 100
                case "bof":
                    hvc.allegresse = 50
                case "nul":
                    hvc.allegresse = 0
                default:
                    break
                }                
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
