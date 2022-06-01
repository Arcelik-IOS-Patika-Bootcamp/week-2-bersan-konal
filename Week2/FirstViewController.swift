//
//  SecondViewController.swift
//  Week2
//
//  Created by Muzaffer Berşan Konal on 1.06.2022.
//

import UIKit

protocol ZodiacSignDelegate {
    func getData(sign: String)
}

class FirstViewController: UIViewController {
    @IBOutlet weak var zodiacSignLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacSignLabel.isHidden = true
       
    }
    //to present second vc
    @IBAction func goToVC(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
            zodiacSignLabel.isHidden = false
        }
            
    }
}

extension FirstViewController: ZodiacSignDelegate {
    func getData(sign: String) {
        zodiacSignLabel.text = sign
    }
}
