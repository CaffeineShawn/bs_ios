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
    @Published var offset: CGSize = .zero
    @Published var bgOpacity: Double = 1
    @Published var imageScale: CGFloat = 1
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
    
    func toggleShowingImageView(selectedImageIndex: Int) {
        self.selectedImageIndex = selectedImageIndex
        self.showingImages.toggle()
        print(selectedImageIndex)
    }
    
    func onChange(offset: CGSize) {
        if (imageScale == 1) {
            
            let halgHeight = UIScreen.main.bounds.height/2
            let progress = abs(offset.height)/halgHeight
            bgOpacity = Double(1 - progress)
            self.offset = offset
        } else {
            self.offset.width += offset.width / (imageScale*imageScale)
            self.offset.height += offset.height / (imageScale*imageScale)
        }
        
//        withAnimation(.default) {
//        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if imageScale == 1 {
                if abs(value.translation.height) < 250 {
                    offset = .zero
                } else {
                    showingImages.toggle()
                    offset = .zero
                }
            }
            bgOpacity = 1
        }
    }
}
