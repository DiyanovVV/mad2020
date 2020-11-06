//
//  LoginViewController.swift
//  Diyanov MADAdventure
//
//  Created by DiyanovVV on 02.11.2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailLineTFImage: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordLineTFImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTF.delegate = self
        
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        passwordTF.delegate = self
        
        loginView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    @IBAction func authAction(_ sender: Any) {
        if emailTF.text!.isEmpty && passwordTF.text!.isEmpty {
            errorAlert(text: "Error", desc: "Email and Password is Empty")
        } else
        if emailTF.text!.isEmpty {
            errorAlert(text: "Error", desc: "Email is Empty")
        } else if passwordTF.text!.isEmpty {
            errorAlert(text: "Error", desc: "Password is Empty")
        } else {
            authUser(name: emailTF.text!, password: passwordTF.text!)
        }
    }
    
    
    @IBAction func facebookAuthAction(_ sender: Any) {
        errorAlert(text: "Auth", desc: "Sorry, Is not working")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func authUser(name: String, password: String) {
        let url = "http://wsk2019.mad.hakta.pro/api/user/login"
        
        let parameters: [String:String] = ["email":name, "password":password]
        let headers: HTTPHeaders = [
                    "Content-Type":"application/json"
                ]
        AF.request(url, method: .post, parameters: parameters, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func errorAlert(text: String, desc: String) {
        let alert = UIAlertController(title: text, message: desc, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTF {
        emailLineTFImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == passwordTF {
            passwordLineTFImage.image = UIImage(named: "line-TextField-Edit")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
        emailLineTFImage.image = UIImage(named: "line-TextField")
        } else if textField == passwordTF {
            passwordLineTFImage.image = UIImage(named: "line-TextField")
        }
    }
}
