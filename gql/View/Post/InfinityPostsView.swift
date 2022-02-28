//
//  InfinityPostsView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI
import Apollo

struct InfinityPostsView: View {
    
    @ObservedObject var postLoader = PostListLoader()
    
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    if postLoader.posts.count == 0 {
                        Text("No content")
                    } else {
                        ForEach(postLoader.posts, id: \.node?.id) { post in
                                if let post = post.node {
//                                    PostCell(postId: post.id, content: post.content, images: post.images, creatorName: post.creator?.name ?? "小白板")
                                    PostCell(post: post)
                                        .padding(.top, 12)
                                        .onAppear {

                                            if post.id == postLoader.posts.last?.node?.id {
                                                let _ = postLoader.fetchPost()
                                            }
                                        }
                                }
                            
                        }
                    
                    }
                }
            }
            .background(Color(red:246/255.0, green:246/255.0, blue:246/255.0).edgesIgnoringSafeArea(.all))
            .navigationTitle("BlankSpace")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let _ = postLoader.fetchPost()
            }
        }
 
        
        
        

    }
}

struct InfinityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityPostsView()
    }
}
