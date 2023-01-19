//
//  ConfigurationManager.swift
//
//  Created by Jorge Enrique Ventura Gonzales on 8/11/20.
//  Copyright © 2020 Jorge Enrique Ventura Gonzales. All rights reserved.
//

import Foundation

public class SettingsManager {

    public let KEY_SAVE = "KEY_SAVE"
    public let KEY_NAME = "KEY_NAME"
    public let KEY_SURNAME = "KEY_SURNAME"
    public let KEY_LASTNAME = "KEY_LASTNAME"
    public let KEY_GENDER = "KEY_GENDER"
    public let KEY_BIRTH = "KEY_BIRTH"
    
    
    init() {
        
        UserDefaults.standard.register(defaults: [
            KEY_SAVE: "",
            KEY_NAME: "",
            KEY_SURNAME: "",
            KEY_LASTNAME: "",
            KEY_GENDER: "",
            KEY_BIRTH: ""
            
        ])
        
    }
    
    var save: Bool {
        get { UserDefaults.standard.bool(forKey: KEY_SAVE) ?? false }
        set { UserDefaults.standard.set(newValue, forKey: KEY_SAVE) }
    }
    
    var name: String {
        get { UserDefaults.standard.string(forKey: KEY_NAME) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: KEY_NAME) }
    }
    
    var surname: String {
        get { UserDefaults.standard.string(forKey: KEY_SURNAME) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: KEY_SURNAME) }
    }
    
    var lastName: String {
        get { UserDefaults.standard.string(forKey: KEY_LASTNAME) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: KEY_LASTNAME) }
    }
    
    public var gender: String {
        get { UserDefaults.standard.string(forKey: KEY_GENDER) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: KEY_GENDER) }
    }
    
    public var birth: String {
        get { UserDefaults.standard.string(forKey: KEY_BIRTH) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: KEY_BIRTH) }
    }
    
}
