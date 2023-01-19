//
//  MovieNetwork.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 5/05/22.
//



import Foundation

enum MovieService: ServiceEnum {
    case LocationList(lat: String, lon: String)
}

struct LocationNetworkFactory: Networking {

    typealias EnumType = MovieService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
     
        case .LocationList(let lat, let lon):
            return LocationListNetwork(lat: lat, lon: lon)
       
        }
    }
}

extension LocationNetworkFactory {
    
    private struct LocationListNetwork: Requestable {
        var method: HTTPMethod = .get
      
        
        private var lat: String
        private var lon: String
        
       // var path: String =  Constant.Endpoint.listLocation
        
        var path: String = ""
        
        var parameters: [String: Any] = [:]
        
        init(lat: String, lon: String) {
            
            let n1 =  Constant.Endpoint.listLocationlatitude
            let n2 =  Constant.Endpoint.listLocationlongitude
            let n3 =  Constant.Endpoint.listLocationComplete
            
            self.path = n1 + lat + n2 + lon + n3
            print("COMPLETO \(path)")
            self.lat = lat
            self.lon = lon
        }

    }

}
