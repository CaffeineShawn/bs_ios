//
//  ImageLoader.swift
//  gql
//
//  Created by Shaw Young on 2022/2/23.
//

import Foundation
import UIKit

enum NetworkingError: String, Error {
    case BAD_URL = "BAD URL"
    case BAD_RESPONSE = "BAD RESPONSE"
    case BAD_RESOURCE = "BAD RESOURCE"
}


final class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var error: String? = nil
    @Published var loading: Bool = false
    
    let urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString ?? "" + "?imageMogr2/format/webp"
    }
    
    func fetch() {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            error = NetworkingError.BAD_URL.localizedDescription
            return
        }
        
        loading = true
        error = nil
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.loading = false
                if let error = error {
                    self?.error = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self?.error = "\(NetworkingError.BAD_RESPONSE.localizedDescription)), statusCode: \(response.statusCode)"
                } else if let data = data, let image = UIImage(data: data) {
                    self?.image = image
                } else {
                    self?.error = NetworkingError.BAD_RESOURCE.localizedDescription
                }
            }
        }
        task.resume()
    }
    
    
}
