//
//  HATextField.swift
//  HALoginSDK
//
//  Created by WHIZ on 20/12/22.
//

import Foundation
import UIKit



protocol textFieldRegisterProtocol: class  {
    func iconWillPressButton(_ sender: HATextField)
    func textFieldShouldBeginEditing(_ sender: HATextField, _ textField: UITextField) -> Bool // return NO to disallow editing.
    func textFieldDidBeginEditing(_ sender: HATextField, _ textField: UITextField) // became first responder
    func textFieldShouldEndEditing(_ sender: HATextField, _ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    func textFieldDidEndEditing(_ sender: HATextField, _ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldDidEndEditing(_ sender: HATextField, _ textField: UITextField, reason: UITextField.DidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:
    func textField(_ sender: HATextField, _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text
    func textFieldDidChangeSelection(_ sender: HATextField, _ textField: UITextField)
    func textFieldShouldClear(_ sender: HATextField, _ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldReturn(_ sender: HATextField, _ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    func IconButtonTapped(_ id: String)
}



class HATextField: UIView {
    
    let classNibName = "HATextField"
    
    @IBOutlet var contentView: HATextField!
    
    @IBOutlet weak var containerTextField: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewtexField: UIView!
    @IBOutlet weak var buttonIcon: UIButton!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconButton: UIButton!
    
    
    
    let gradient = CAGradientLayer()
    
    var delegate: textFieldRegisterProtocol?
   
    var id: String = ""
    var textSecureEntry = false
    var iconClick = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.config()
        customTheme()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.config()
        self.displayView()
        customTheme()
        setupTextField()
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.displayView()
        customTheme()
        setupTextField()
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textField.delegate = self
        addBorderTextField()
    }
    
    
  
    func addBorderTextField() {
        
        self.viewtexField.layer.cornerRadius = 16
        self.viewtexField.clipsToBounds = true
        self.viewtexField.layer.borderWidth = 3
        self.viewtexField.layer.borderColor = #colorLiteral(red: 0.6038371836, green: 0.6090333524, blue: 0.624621859, alpha: 1)
    }
 
    
    private func config() {
        _ = UINib(nibName: classNibName , bundle: nil ).instantiate(withOwner: self).first as? HATextField
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
    private func customTheme() {

        self.viewtexField.layer.cornerRadius = 16
        self.viewtexField.clipsToBounds = true
       
    }
    
    private func setupTextField() {
//        self.textField.font =  HSUOpenClass.applyPoppinsRegular(size: 16)
//        self.textField.textColor = UIColor.baseColorLetter
    }
    
    convenience init(
        delegate: textFieldRegisterProtocol? = nil,
        id: String = "",
        iconText:  String? = "",
        placeholder:  String? = "",
        hideIcon: Bool = false,
        enableButtonIcon: Bool = false,
        textSecureEntry: Bool = false
        
    ) {
        self.init(frame: .zero)
        self.displayView(delegate: delegate, id: id, iconText:  iconText, textSecureEntry: textSecureEntry)
    }
    
    
    func displayView(
        delegate: textFieldRegisterProtocol? = nil,
        id: String? = "",
        iconText:  String? = "",
        placeholder:  String? = "",
        hideIcon: Bool = false,
        enableButtonIcon: Bool = false,
        textSecureEntry: Bool = false ) {
            self.delegate = delegate
            self.id = id ?? ""
           // let image = UIImage(named: iconText!, in: .local, with: nil)
           // self.buttonIcon.setImage(image, for: .normal)
            self.textField.placeholder = placeholder
            
            self.buttonIcon.isEnabled = !enableButtonIcon
            self.iconView.isHidden = hideIcon
            self.iconButton.isHidden = hideIcon
            
            self.textSecureEntry = textSecureEntry
//            if textSecureEntry {
//                self.textField.isSecureTextEntry = true
//            }
           
//            if self.id == "2" {
//                self.textField.isSecureTextEntry = true
//            }
           
        }
    
    @IBAction func iconButtonAction(_ sender: Any) {
       
        self.delegate?.IconButtonTapped(self.id)
        
        if self.textSecureEntry {
      // if self.id == "2" {
            if iconClick {
                self.textField.isSecureTextEntry = false
                iconClick = false
            } else {
                self.textField.isSecureTextEntry = true
                iconClick = true
            }
        }
        //}
    }
}


extension HATextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let safeResult = delegate?.textFieldShouldBeginEditing(self, textField) else { return false }
        
        print("textFieldShouldBeginEditingTEXR1 \(textField.text)")
        return safeResult
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("texttextFieldDidBeginEditing1 \(textField.text)")
        delegate?.textFieldDidBeginEditing(self, textField)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let safeResult = delegate?.textFieldShouldEndEditing(self, textField) else { return false }
        print("textextFieldShouldEndEditing1 \(textField.text)")
        return safeResult
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textexttextFieldDidEndEditing1 \(textField.text)")
        delegate?.textFieldDidEndEditing(self, textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason)  {
        print("textextextFieldDidEndEditing1 \(textField.text)")
        delegate?.textFieldDidEndEditing(self, textField, reason: reason)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let safeResult = delegate?.textField(self, textField, shouldChangeCharactersIn: range, replacementString: string) else { return false }
        print("texttextField1 \(textField.text)")
        return safeResult
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textextFieldDidChangeSelection1 \(textField.text)")
        
      
        
        
        delegate?.textFieldDidChangeSelection(self, textField)
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        guard let safeResult = delegate?.textFieldShouldClear(self, textField) else { return false }
        print("textexttextFieldShouldClear1 \(textField.text)")
        return safeResult
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let safeResult = delegate?.textFieldShouldReturn(self, textField) else { return false }
        print("textextextFieldShouldReturn1 \(textField.text)")
        return safeResult
    }
    
   
}
