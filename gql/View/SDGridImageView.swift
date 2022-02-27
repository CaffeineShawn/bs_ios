//
//  SDGridImageView.swift.swift
//  gql
//
//  Created by Shaw Young on 2022/2/26.
//

import SwiftUI

struct SDGridImageView: View {
    

    
    
    let triGridItems: [GridItem]
//    [GridItem(.flexible(), spacing: 7),GridItem(.flexible(), spacing: 7),GridItem(.flexible(), spacing: 7)]
    let images: [String]
    
    init(images: [String]) {
        if images.count == 4 {
            self.images = images[0...1] + [""] + images[2...3]
        } else {
            let lowerBound = images.endIndex-1 > 5 ? 5 : images.endIndex-1
            self.images = Array(images[0...lowerBound])
        }
        self.triGridItems = [GridItem(.flexible(), spacing: 7),GridItem(.flexible(), spacing: 7),GridItem(.flexible(), spacing: 7)]
    }
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Group {
                    switch images.count {
                    case 1:
                        SDWebImageView(urlString: images.first!, width: proxy.size.height, height: proxy.size.height)
                    case 2...3:
                        LazyVGrid(columns: triGridItems, spacing: 7) {
                            ForEach(images, id: \.self) { url in
                                SDWebImageView(urlString: url, width: proxy.size.width/3-14/3, height: proxy.size.height)
                                    .frame(width: proxy.size.width/2-7/2, height: proxy.size.height)
                            }
                        }
                    case 4...6:
                        LazyVGrid(columns: triGridItems, spacing: 7) {
                            ForEach(images, id: \.self) { url in
                                SDWebImageView(urlString: url, width: proxy.size.width/3-14/3, height: 260/2-3.5)
                                    .frame(width: proxy.size.width/3-14/3, height: proxy.size.height/2-3.5)
                            }
                        }
                    default:
                        fatalError()
                    }
                }
            }
            .frame(height: images.count > 3 || images.count == 1 ? 260 : 130)
       

        }
     
        .padding(.horizontal, 7)
        .background(Color.red)
    }
}

struct SDGridImageView_swift_Previews: PreviewProvider {
    static let images = [
        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg"
//        ,
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/female.jpg",
//
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/help-please.png",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/valentine.jpg",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/1px-life.png"
    ]
    static var previews: some View {
        SDGridImageView(images: images)
    }
}
