//
//  LocationPresenter.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class LocationPresenter {
    weak private var view: LocationViewProtocol?
    var interactor: LocationInteractorInputProtocol?
    private let router: LocationWireframeProtocol

    init(interface: LocationViewProtocol, interactor: LocationInteractorInputProtocol?, router: LocationWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension LocationPresenter: LocationPresenterProtocol {
    func prepareResponseForModel(lat: String, lon: String) {
        self.interactor?.prepareData(lat: lat, lon: lon)
    }
}

extension LocationPresenter: LocationInteractorOutputProtocol {
   
    func fetchedDataSuccess(data: LocationResponse) {
        
        guard let vc = view as? UIViewController else { return }
       vc.hideLoader()
        self.view?.fetchedData(data: data)
        
        
        print("fetchedDataSuccess: \(data)")
    }
    
}
