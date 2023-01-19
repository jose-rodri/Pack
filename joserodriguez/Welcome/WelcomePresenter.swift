//
//  WelcomePresenter.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class WelcomePresenter {
    weak private var view: WelcomeViewProtocol?
    var interactor: WelcomeInteractorInputProtocol?
    private let router: WelcomeWireframeProtocol

    init(interface: WelcomeViewProtocol, interactor: WelcomeInteractorInputProtocol?, router: WelcomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    
}

extension WelcomePresenter: WelcomeInteractorOutputProtocol {
    
}