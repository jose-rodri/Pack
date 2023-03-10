//
//  LocationProtocols.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import Foundation

//MARK: Presenter -> Router
protocol LocationWireframeProtocol: AnyObject {
    
}

//MARK: View -> Presenter
protocol LocationPresenterProtocol: AnyObject {
    var interactor: LocationInteractorInputProtocol? { get set }
    
    func prepareResponseForModel(lat: String, lon: String)
    
    
}

//MARK: Interactor -> Presenter
protocol LocationInteractorOutputProtocol: AnyObject {
    func fetchedDataSuccess(data: LocationResponse)
    
}

//MARK: Presenter -> Interactor
protocol LocationInteractorInputProtocol: AnyObject {
    var presenter: LocationInteractorOutputProtocol?  { get set }
    func prepareData(lat: String, lon: String)
}

//MARK: Presenter -> View
protocol LocationViewProtocol: AnyObject {
    var presenter: LocationPresenterProtocol?  { get set }
    
    func fetchedData(data: LocationResponse)
}
