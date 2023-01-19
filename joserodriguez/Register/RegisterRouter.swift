//
//  RegisterRouter.swift
//  joserodriguez
//
//  Created WHIZ on 23/12/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class RegisterRouter: RegisterWireframeProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = RegisterViewController(nibName: "RegisterViewController", bundle: .local)
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

extension Bundle {
    static func bundleOfSelf() -> Bundle {
        return Bundle(for: RegisterRouter.self)
    }
    
    static let local: Bundle = Bundle.init(for: RegisterRouter.self)
}


