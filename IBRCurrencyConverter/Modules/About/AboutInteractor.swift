import Foundation

class AboutInteractor: AboutInteractorProtocol {
    
    weak var presenter: AboutPresenterProtocol!
    let serverService: ServerServiceProtocol = ServerService()
    
    required init(presenter: AboutPresenterProtocol) {
        self.presenter = presenter
    }
    
    var urlRatesSource: String {
        get {
            return serverService.urlRatesSource
        }
    }
    
    func openUrl(with urlString: String) {
        serverService.openUrl(with: urlString)
    }
}
