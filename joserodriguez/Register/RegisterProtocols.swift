//
//  RegisterProtocols.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import Foundation

//MARK: Presenter -> Router
protocol RegisterWireframeProtocol: AnyObject {
    
}

//MARK: View -> Presenter
protocol RegisterPresenterProtocol: AnyObject {
    var interactor: RegisterInteractorInputProtocol? { get set }
}

//MARK: Interactor -> Presenter
protocol RegisterInteractorOutputProtocol: AnyObject {
    
}

//MARK: Presenter -> Interactor
protocol RegisterInteractorInputProtocol: AnyObject {
    var presenter: RegisterInteractorOutputProtocol?  { get set }
}

//MARK: Presenter -> View
protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol?  { get set }
}
