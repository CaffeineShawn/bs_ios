//
//  CacheManager.swift
//  gql
//
//  Created by Shaw Young on 2022/2/24.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024*1024*512
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    let imageName: String = "sb"
    let manager =  CacheManager.instance
    
    init() {
        getImageFromAssertsFolder()
    }
    
    func getImageFromAssertsFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = image else {
            return
        }
        manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        manager.remove(name: imageName)
    }
    
    func getFromCache() {
        cachedImage = manager.get(name: imageName)
    }
}
