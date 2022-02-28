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
                        SDWebImageView(urlString: images.first!, width: 260, height: 260)
                    case 2...3:
                        LazyVGrid(columns: triGridItems, spacing: 7) {
                            ForEach(0...images.count-1, id: \.self) { idx in
                                SDWebImageView(urlString: images[idx], width: (UIScreen.main.bounds.width-84)/3-14/3, height: (UIScreen.main.bounds.width-84)/3)
                                    .frame(width: abs(proxy.size.width/3-14/3))
                            }
                        }
                    default:
                        LazyVGrid(columns: triGridItems, spacing: 7) {
                            ForEach(0...(images.count-1 > 5 ? 5: images.count - 1), id: \.self) { idx in
                                SDWebImageView(urlString: images[idx], width: (UIScreen.main.bounds.width-84)/3-14/3, height: (UIScreen.main.bounds.width-84)/3)
                                    .frame(width: abs(proxy.size.width/3-14/3))

                            }
                        }
                    }
                }
            }
            .frame(height: images.count == 1 ? 260 : (images.count < 4 ? (UIScreen.main.bounds.width-84)/3 : (UIScreen.main.bounds.width-84)/3*2+7))
        }
     
        .padding(.horizontal, 7)
    }
}

struct SDGridImageView_swift_Previews: PreviewProvider {
    static let images = [
        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg"
        ,
        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/female.jpg",

        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg",
        "data:image/png;base64,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",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/help-please.png",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/valentine.jpg",
//        "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/1px-life.png"
    ]
    static var previews: some View {
        SDGridImageView(images: images)
            .padding(.horizontal, 35)
            .background(.red)
    }
}
