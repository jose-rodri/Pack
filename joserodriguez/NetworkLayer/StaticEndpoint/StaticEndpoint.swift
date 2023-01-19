//
//  StaticEndpoint.swift
//  joserodriguez
//
//  Created by WHIZ on 23/12/22.
//


import Foundation

struct Constant {
    static let apiKey = "-77.02239990234375&appid=aba8a3bd6aee3a93e0f755703943d1c3"

   
    struct IconURL {
        //static let apiIcon =  "img/wn/04d@2x.png"
        static let apiIcon =  "img/wn/"
    }
    
    
    struct Endpoint {
        static let baseURL = "http://openweathermap.org/"
        
        static let listLocation = "/data/2.5/weather?lat=-12.067523861901428&lon=-77.02239990234375&appid=aba8a3bd6aee3a93e0f755703943d1c3"
      
        
        static let listLocationlatitude = "data/2.5/weather?lat="
        static let listLocationlongitude = "&lon="
        static let listLocationComplete = "&appid=aba8a3bd6aee3a93e0f755703943d1c3"
        
    }
    
  
}
