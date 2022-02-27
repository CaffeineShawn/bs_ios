//
//  PostCellView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/22.
//

import SwiftUI

struct PostCellView: View {
    let postId: String
    let content: String
    let images: [String]?
//    let
//    let content: String = "早上好中国，现在我有bing chilling，我很喜欢bing chilling，但是，速度与激情九"
//    let images: [String] = ["https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/female.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/help-please.png","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/valentine.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/1px-life.png"]

    
    var body: some View {
        VStack(spacing: 0) {
            Text(content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 18, leading: 23, bottom: 14, trailing: 21))
            HStack {
                if let images = images {
                    SDGridImageView(images: images)
//                        .frame(height: images.count > 3 || images.count == 1 ? 260 : 130)
                    .frame(height: images.count == 1 ? 260 : (images.count < 4 ? 130-27 : 260-54))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 23)
                }
                Spacer()
            }
            
            
            
        }
        .background(in: RoundedRectangle(cornerRadius: 10))
        .padding(10)
        
    }
}


struct PostImageListView: View {
    let images: [String]
    
    private let gridItemLayout = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7)]
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                if images.count > 1 {
                    LazyVGrid(columns: gridItemLayout, spacing: 7) {
                        ForEach(images, id:\.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: proxy.size.width/3, height: proxy.size.width/3)
                                     .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } placeholder: {
                                ProgressView()
                                .frame(width: proxy.size.width/3)                     }

                        }
                        .onTapGesture {
                            print("width: \(proxy.size.width), height: \(proxy.size.height)")
                        }
                    }
                } else {
                    CacheAsyncImage(url: URL(string: images.first! + "?imageMogr2/format/webp")!) { phase in
                        if let image = phase.image {
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: 186, height: 186)
                                 .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else if phase.error != nil {
                            Text("Error")
                                .frame(width: 186, height: 186)
                                .foregroundColor(.red)
                        } else {
                            ProgressView()
                                .frame(width: 186, height: 186)
                        }
                        
                    }
                    
                }

                    
            }

        }
        .padding(.horizontal, 23)
        
        
        
    }
}



//struct MyPreviewProvider_Previews: PreviewProvider {
//    static let pmages: [String] = ["https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/female.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/help-please.png","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/valentine.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/1px-life.png"]
//
//    static var previews: some View {
//        PostImageListView(images: pmages)
//    }
//}
//







//struct PostCell_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        VStack {
//
//            PostCell(postId: "0x1e09c")
//                .padding(.horizontal, 20)
//                .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
//        }
//        .background(Color(red:246/255.0, green:246/255.0, blue:246/255.0)
//                        .edgesIgnoringSafeArea(.all))
//
//
//    }
//}
