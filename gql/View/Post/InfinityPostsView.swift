//
//  InfinityPostsView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI
import Apollo

struct InfinityPostsView: View {
    
    @StateObject var postLoader = PostListLoader()
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    if postLoader.posts.count == 0 {
                        Text("No content")
                    } else {
                        ForEach(postLoader.posts, id: \.node?.id) { post in
                            if let post = post.node {
                                PostCell(post: post)
                                    .padding(.top, 12)
                                    .padding(.horizontal, 12)
                                    .onAppear {
                                        print(post.id)
                                        print(post.createdAt)
                                        if post.id == postLoader.posts.last?.node?.id {
                                            postLoader.fetchLaterPost(count: 5)
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
                postLoader.fetchLaterPost(count: 10)
            }
            
        }
    }
}

struct InfinityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityPostsView()
    }
}
