import Foundation

protocol AboutViewProtocol: class {
    func setUrlButtonTitle(with title: String)
}

protocol AboutPresenterProtocol: class {
    var router: AboutRouterProtocol! { set get }
    func configureView()
    func closeButtonClicked()
    func urlButtonClicked(with urlString: String?)
}

protocol AboutInteractorProtocol: class {
    var urlRatesSource: String { get }
    func openUrl(with urlString: String)
}

protocol AboutRouterProtocol: class {
    func closeCurrentViewController()
}

protocol AboutConfiguratorProtocol: class {
    func configure(with viewController: AboutViewController)
}
