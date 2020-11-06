//
//  AccessPhoneViewController.swift
//  Diyanov MADAdventure
//
//  Created by DiyanovVV on 06.11.2020.
//

import UIKit

class AccessPhoneViewController: UIViewController {

    @IBOutlet weak var accessBackgroundView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var numberTF1: UITextField!
    @IBOutlet weak var numberTF2: UITextField!
    @IBOutlet weak var numberTF3: UITextField!
    @IBOutlet weak var numberTF4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessBackgroundView.layer.cornerRadius = 15
        phoneLabel.text = "\(UserDefaults.standard.string(forKey: "code")) \(UserDefaults.standard.string(forKey: "phone"))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if sender.hasText {
            switch sender {
            case numberTF1:
                numberTF2.becomeFirstResponder()
            case numberTF2:
                numberTF3.becomeFirstResponder()
            case numberTF3:
                numberTF4.becomeFirstResponder()
            default:
                sender.resignFirstResponder()
            }
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
