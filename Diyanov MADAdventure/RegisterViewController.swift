//
//  RegisterViewController.swift
//  Diyanov MADAdventure
//
//  Created by DiyanovVV on 02.11.2020.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var lineTextFieldEmailImage: UIImageView!
    
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var lineTextFieldNicknameImage: UIImageView!
    
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var lineTextFieldPhoneImage: UIImageView!
    
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var lineTextFieldCodeImage: UIImageView!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var lineTextFieldPasswordImage: UIImageView!
    
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var lineTextFieldRepeatPasswordImage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var registerView: UIView!
    
    // Errors strings
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorNicknameLabel: UILabel!
    @IBOutlet weak var errorPhoneLabel: UILabel!
    @IBOutlet weak var errorCodeLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var errorRepeatPasswordLabel: UILabel!
    
    var checkValidation: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTF.delegate = self
        
        nicknameTF.attributedPlaceholder = NSAttributedString(string: "Nickname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        nicknameTF.delegate = self
        
        phoneTF.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        phoneTF.delegate = self
        
        codeTF.attributedPlaceholder = NSAttributedString(string: "Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        codeTF.delegate = self
        
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTF.delegate = self
        
        repeatPasswordTF.attributedPlaceholder = NSAttributedString(string: "Repeat password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        repeatPasswordTF.delegate = self
        
        registerView.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        // Hidden Error Labels
        editTextFieldsImage(bool: true)
        
        // Check Empty
        if emailTF.text!.isEmpty {
            lineTextFieldEmailImage.image = UIImage(named: "line-TextField-Error")
            errorEmailLabel.text = "Email is Empty"
            errorEmailLabel.isHidden = false
            checkValidation = false
        }
        if nicknameTF.text!.isEmpty {
            lineTextFieldNicknameImage.image = UIImage(named: "line-TextField-Error")
            errorNicknameLabel.text = "Nickname is Empty"
            errorNicknameLabel.isHidden = false
            checkValidation = false
        }
        if phoneTF.text!.isEmpty {
            lineTextFieldPhoneImage.image = UIImage(named: "line-TextField-Error")
            errorPhoneLabel.text = "Phone is Empty"
            errorPhoneLabel.isHidden = false
            checkValidation = false
        }
        if codeTF.text!.isEmpty {
            errorCodeLabel.isHidden = false
            checkValidation = false
        }
        if passwordTF.text!.isEmpty {
            lineTextFieldPasswordImage.image = UIImage(named: "line-TextField-Error")
            errorPasswordLabel.text = "Password is Empty"
            errorPasswordLabel.isHidden = false
            checkValidation = false
        }
        if repeatPasswordTF.text!.isEmpty {
            lineTextFieldRepeatPasswordImage.image = UIImage(named: "line-TextField-Error")
            errorRepeatPasswordLabel.text = "Re-Password is Empty"
            errorRepeatPasswordLabel.isHidden = false
            checkValidation = false
        }
        
        // Check validation
        let info = emailTF.text
        let char: Character = "@"
        if !(info!.contains(char)) {
            errorEmailLabel.text = "Bad Email"
            errorEmailLabel.isHidden = false
            lineTextFieldEmailImage.image = UIImage(named: "line-TextField-Error")
            checkValidation = false
        }
        if phoneTF.text?.count != 10 {
            errorPhoneLabel.text = "Bad Phone"
            errorPhoneLabel.isHidden = false
            lineTextFieldPhoneImage.image = UIImage(named: "line-TextField-Error")
            checkValidation = false
        }
        if passwordTF.text! != repeatPasswordTF.text! {
            errorRepeatPasswordLabel.text = "Passwords doesnt Match"
            errorRepeatPasswordLabel.isHidden = false
            lineTextFieldRepeatPasswordImage.image = UIImage(named: "line-TextField-Error")
            checkValidation = false
        }
        
        if checkValidation == true {
            editTextFieldsImage(bool: true)
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
    
    func editTextFieldsImage(bool: Bool) {
        errorEmailLabel.isHidden = bool
        errorNicknameLabel.isHidden = bool
        errorPhoneLabel.isHidden = bool
        errorCodeLabel.isHidden = bool
        errorPasswordLabel.isHidden = bool
        errorRepeatPasswordLabel.isHidden = bool
        lineTextFieldPhoneImage.image = UIImage(named: "line-TextField")
        lineTextFieldPasswordImage.image = UIImage(named: "line-TextField")
        lineTextFieldRepeatPasswordImage.image = UIImage(named: "line-TextField")
        lineTextFieldCodeImage.image = UIImage(named: "line-TextField")
        lineTextFieldEmailImage.image = UIImage(named: "line-TextField")
        lineTextFieldNicknameImage.image = UIImage(named: "line-TextField")
    }

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTF {
            lineTextFieldEmailImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == nicknameTF {
            lineTextFieldNicknameImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == phoneTF {
            lineTextFieldPhoneImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == codeTF {
            lineTextFieldCodeImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == passwordTF {
            lineTextFieldPasswordImage.image = UIImage(named: "line-TextField-Edit")
        } else if textField == repeatPasswordTF {
            lineTextFieldRepeatPasswordImage.image = UIImage(named: "line-TextField-Edit")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
            lineTextFieldEmailImage.image = UIImage(named: "line-TextField")
            errorEmailLabel.isHidden = true
        } else if textField == nicknameTF {
            lineTextFieldNicknameImage.image = UIImage(named: "line-TextField")
            errorNicknameLabel.isHidden = true
        } else if textField == phoneTF {
            lineTextFieldPhoneImage.image = UIImage(named: "line-TextField")
            errorPhoneLabel.isHidden = true
        } else if textField == codeTF {
            lineTextFieldCodeImage.image = UIImage(named: "line-TextField")
            errorCodeLabel.isHidden = true
        } else if textField == passwordTF {
            lineTextFieldPasswordImage.image = UIImage(named: "line-TextField")
            errorPasswordLabel.isHidden = true
        } else if textField == repeatPasswordTF {
            lineTextFieldRepeatPasswordImage.image = UIImage(named: "line-TextField")
            errorRepeatPasswordLabel.isHidden = true
        }
    }
}
