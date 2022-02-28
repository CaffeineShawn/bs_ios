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
                                PostCell(post: post)
                                    .padding(.top, 12)
                                    .padding(.horizontal, 12)
                                    .onAppear {
                                        if post.id == postLoader.posts.last?.node?.id {
                                            postLoader.fetchLaterPost()
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
                postLoader.fetchLaterPost()
            }
            .refreshable {
                postLoader.fetchNewerPost()
            }
        }
    }
}

struct InfinityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityPostsView()
    }
}
