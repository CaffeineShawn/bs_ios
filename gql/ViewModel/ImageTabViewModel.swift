//
//  ImageTabViewModel.swift
//  gql
//
//  Created by Shaw Young on 2022/3/1.
//

import SwiftUI

final class ImageTabViewModel: ObservableObject {
    @Published var selected: String? = nil
    @Published var selectedImageIndex: Int = 0
    @Published var showingImages: Bool = false

    let images: [String]
    
    init(images: [String]) {
        self.images = images
    }
    
//    func changeCurrentTab(forward: Bool) {
//        if let _ = self.currentTab {
//            self.currentTab! += forward ? 1 : -1
//        }
//        
//    }
    
    func toggleShowingImageView(selected: String? = nil) {
        self.selected = selected
        self.showingImages.toggle()
        print(selected)
    }
    
    func toggleShowingImageView(selectedImageIndex: Int) {
        self.selectedImageIndex = selectedImageIndex
        self.showingImages.toggle()
        print(selectedImageIndex)
    }
}
