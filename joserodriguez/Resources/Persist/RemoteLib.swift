//
//  RemoteLib.swift
//  HCSRT
//
//  Created by Jose Leoncio Quispe Rodriguez on 5/14/21.
//


import Foundation

public class RemoteLib {
    
    public static let shared = RemoteLib()

    public let settingsManager = SettingsManager()

    
    public func setData(save: Bool, name:String, surname:String, lastName:String , gender:String , birth:String ){
        settingsManager.save = save
        settingsManager.name = name
        settingsManager.surname = surname
        settingsManager.lastName = lastName
        settingsManager.gender = gender
        settingsManager.birth = birth
    }
    
    
}

