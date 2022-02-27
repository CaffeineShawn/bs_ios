//
//  PostCellView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/22.
//

import SwiftUI

struct PostCellView: View {
    let post: PostWithRelayQuery.Data.PostsWithRelay.Edge.Node
//    let
//    let content: String = "早上好中国，现在我有bing chilling，我很喜欢bing chilling，但是，速度与激情九"
//    let images: [String] = ["https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/female.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/help-please.png","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/valentine.jpg","https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/subjectAvatars/1px-life.png"]
//
    
    var body: some View {
        VStack(spacing: 0) {
            Text(post.content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 18, leading: 23, bottom: 14, trailing: 21))
            HStack {
                if let images = post.images {
                    PostImageListView(images: [images.first!])
                        .frame(width: 186, height: 186, alignment: .leading)
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
                                     .frame(height: proxy.size.width/3)
                                     .scaledToFill()
                                     .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } placeholder: {
                                ProgressView()
                            }

                        }
                        .onTapGesture {
                            print("width: \(proxy.size.width), height: \(proxy.size.height)")
                        }
                    }
                } else {
                    AsyncImage(url: URL(string: images.first! + "?imageMogr2/format/webp")) { phase in
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
//    static var previews: some View {
//        PostCellView()
//    }
//}


