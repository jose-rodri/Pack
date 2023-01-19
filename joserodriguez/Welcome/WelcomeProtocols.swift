//
//  WelcomeProtocols.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import Foundation

//MARK: Presenter -> Router
protocol WelcomeWireframeProtocol: AnyObject {
    
}

//MARK: View -> Presenter
protocol WelcomePresenterProtocol: AnyObject {
    var interactor: WelcomeInteractorInputProtocol? { get set }
}

//MARK: Interactor -> Presenter
protocol WelcomeInteractorOutputProtocol: AnyObject {
    
}

//MARK: Presenter -> Interactor
protocol WelcomeInteractorInputProtocol: AnyObject {
    var presenter: WelcomeInteractorOutputProtocol?  { get set }
}

//MARK: Presenter -> View
protocol WelcomeViewProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol?  { get set }
}
