//
//  TextViewController.swift
//  Happy
//
//  Created by Guillaume Savin on 15/03/2021.
//

import UIKit

class TextViewController: UIViewController {
    
    var histoire : String = "Début de l'histoire\n" {
        didSet {
            texte?.text = histoire
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var texte: UITextView! {
        didSet {
            texte?.text = histoire
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
