import Foundation
import UIKit // for UIApplication

protocol ServerServiceProtocol: class {
    var urlRatesSource: String { get }
    func openUrl(with urlString: String)
    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
}

class ServerService: ServerServiceProtocol {
    
    // MARK: - ServerServiceProtocol methods
    
    var urlRatesSource: String {
        return "https://www.exchangerate-api.com"
    }
    
    func openUrl(with urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        if let URL = URL(string: url) {
            getJSON(URL: URL, completion: completion)
        }
    }
    
    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        let stub = [String: Any]()
        completion(stub, nil)
    }
    
    // MARK: - Private methods
        
    private func getJSON(URL: URL, completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        let sharedSession = URLSession.shared
        
        let dataTask = sharedSession.dataTask(with: URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print("Error to load: \(String(describing: error?.localizedDescription))")
                completion(nil, error)
                return
            }
            
            if let dataResponse = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! [String: AnyObject]
                    
                    print("json: \(json), error: \(String(describing: error))")
                    completion(json, nil)
                    return
                    
                } catch let error as NSError {
                    
                    print("Failed to load: \(error.localizedDescription)")
                    completion(nil, error)
                }
            }
        })
        dataTask.resume()
    }

    private let url = "https://open.er-api.com/v6/latest/USD"
}
