import Foundation
import UIKit

class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.currencyPickerView = viewController.currencyPickerView
        viewController.currencyPickerView.delegate = presenter
    }
}
