//
//  RegisterViewController.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewProtocol {
	var presenter: RegisterPresenterProtocol?

    
    
    @IBOutlet weak var txtname: HATextField!
    @IBOutlet weak var txtPaternalSurname: HATextField!
    @IBOutlet weak var txtMotherLastName: HATextField!
    @IBOutlet weak var txtGender: HATextField!
    @IBOutlet weak var dateBirth: HATextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    
    var textName: String = ""
    var textPaternalSurname: String = ""
    var texttMotherLastName: String = ""
    var texGender: String = ""
    var textBirth: String = ""
    
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        hideKeyboardWhenTappedAround()
      
     
      
        
        
        
    }
    
    
   private func setupElements() {
        txtname.displayView(delegate: self, id: "1", iconText: "", placeholder: "Nombre", hideIcon: true, enableButtonIcon: true)
       txtPaternalSurname.displayView(delegate: self, id: "2", iconText: "", placeholder: "Apellido paterno", hideIcon: true, enableButtonIcon: true)
       txtMotherLastName.displayView(delegate: self, id: "3", iconText: "", placeholder: "Apellido Materno", hideIcon: true, enableButtonIcon: true)
       txtGender.displayView(delegate: self, id: "4", iconText: "", placeholder: "Sexo", hideIcon: true, enableButtonIcon: true)
       dateBirth.displayView(delegate: self, id: "5", iconText: "", placeholder: "Secha de nacimiento", hideIcon: true, enableButtonIcon: true)
        
       
       btnRegister.layer.cornerRadius = 16
       btnRegister.layer.masksToBounds = false
       
        shadowElement(sd: txtname)
    }
    
    
   fileprivate func shadowElement(sd: UIView ) {
        
        sd.layer.cornerRadius = 16
        sd.layer.shadowColor = #colorLiteral(red: 0.7450252415, green: 0.7450252415, blue: 0.7450252415, alpha: 1)
        sd.layer.shadowOffset = CGSize(width: 0, height: 3)
        sd.layer.shadowOpacity = 1.0
        sd.layer.shadowRadius = 5.0
        sd.layer.masksToBounds = false
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
     
     
        RemoteLib.shared.setData(save: true, name: textName, surname: textPaternalSurname, lastName: texttMotherLastName, gender: texGender, birth: textBirth)
        
       
        self.showToast(message: "save data..!!", font: .systemFont(ofSize: 12.0))
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in
            self.navigationController?.popViewController(animated: true)
        })
        
        
        
    }
    

    
   
}

extension RegisterViewController:  textFieldRegisterProtocol {
   
    
    
    func iconWillPressButton(_ sender: HATextField) {
        print("sender ==>\(sender)")
    }
    
    func textFieldShouldBeginEditing(_ sender: HATextField, _ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing ==>\(textField.text)")
        return true
    }
    
    func textFieldDidBeginEditing(_ sender: HATextField, _ textField: UITextField) {
        print("textFieldDidBeginEditing ==>\(textField.text)")
    }
    
    func textFieldShouldEndEditing(_ sender: HATextField, _ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing ==>\(textField.text)")
        return true
    }
    
    func textFieldDidEndEditing(_ sender: HATextField, _ textField: UITextField) {
        print("textFieldDidEndEditing ==>\(textField.text)")
    }
    
    func textFieldDidEndEditing(_ sender: HATextField, _ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing ==>\(textField.text)")
    }
    
    func textField(_ sender: HATextField, _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField ==>\(textField.text)")
        return true
    }

    
  
    
    func textFieldDidChangeSelection(_ sender: HATextField, _ textField: UITextField) {
        print("textFieldDidChangeSelection ==>\(textField.text)")
        if sender == txtname {
            if let name = textField.text {
                self.textName = name
            }
          
        } else if sender == txtPaternalSurname {
            if let Surname = textField.text {
                self.textPaternalSurname = Surname
            }
        } else if sender == txtMotherLastName {
            if let lastName = textField.text {
                self.texttMotherLastName = lastName
            }
        } else if sender == txtGender {
            if let gender = textField.text {
                self.texGender = gender
            }
        } else if sender == dateBirth {
            if let dateBirth = textField.text {
                self.textBirth = dateBirth
            }
        } else {
            
        }
    }
    
    func textFieldShouldClear(_ sender: HATextField, _ textField: UITextField) -> Bool {
        print("textFieldShouldClear ==>\(textField.text)")
        return true
    }
    
    func textFieldShouldReturn(_ sender: HATextField, _ textField: UITextField) -> Bool {
        print("textFieldShouldReturn ==>\(textField.text)")
        
        return true
    }
    
    func IconButtonTapped(_ id: String) {
       
    }
    
  
}
