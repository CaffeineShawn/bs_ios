//
//  CustomImageView.swift.swift
//  gql
//
//  Created by Shaw Young on 2022/2/24.
//

import SwiftUI

struct CustomImageView_swift: View {
    @StateObject var imageLoader: ImageLoader
    
    init(urlString: String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(urlString: urlString))
    }
    
    let imageSize: CGFloat = 186
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else if imageLoader.error != nil {
                Text(imageLoader.error!)
                    .foregroundColor(.red)
                    .frame(width: imageSize, height: imageSize)
            } else {
                ProgressView()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
            }
        }
        .onAppear {
            imageLoader.fetch()
        }

    }
}

struct CustomImageView_swift_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView_swift(urlString: "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg?")
    }
}
