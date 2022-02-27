//
//  InfinityPostsView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI
import Apollo

struct InfinityPostsView: View {
    
    @ObservedObject var postLoader = PostLoader()
    
    
    var body: some View {
        ZStack {
            
            Color(red:246/255.0, green:246/255.0, blue:246/255.0).edgesIgnoringSafeArea(.all)
            LazyVStack {
                if postLoader.posts.count == 0 {
                    Text("No content")
                } else {
                    ForEach(postLoader.posts, id: \.node?.id) { post in
                            if let post = post.node {
                                PostCellView(post: post)
                                    .onAppear {
                                        if post.id == postLoader.posts.last?.node?.id {
                                            postLoader.fetchPost(endCursor: postLoader.endCursor)
                                        }
                                    }
                            }
                        
                    }
                
                }
            }
            .onAppear {
                postLoader.fetchPost(endCursor: postLoader.endCursor)
                print("Cache size: \(URLCache.shared.memoryCapacity / 1024)KB")
                URLCache.shared.memoryCapacity = 1024*1024*512
            }
        }
        
        
        

    }
}

struct InfinityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityPostsView()
    }
}
