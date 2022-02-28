//
//  PostLoader.swift
//  gql
//
//  Created by Shaw Young on 2022/2/23.
//

import Foundation
import Apollo

final class PostListLoader: ObservableObject {
    @Published var posts: [PostWithRelayQuery.Data.PostsWithRelay.Edge] = []
    @Published var startCursor: String? = nil
    @Published var endCursor: String? = nil
    @Published var hasNextPage: Bool = true
//    @Published var hasPrevPage: Bool = false
    
    init() {}
    
    func fetchNewerPost() {
        var relayPostQuery: PostWithRelayQuery
        if let startCursor = startCursor {
            relayPostQuery = PostWithRelayQuery(first: 10, before: startCursor)
            DispatchQueue.global(qos: .background).async {
                NetWork.shared.apollo.fetch(query: relayPostQuery) { result in
                    switch result {
                    case .success(let graphQLResult):
                        guard let data = graphQLResult.data
                        else {
                            return
                        }
                        DispatchQueue.main.async {
                            self.posts = data.postsWithRelay.edges.compactMap { $0 } + self.posts
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        
        
    }
    
    func fetchLaterPost() {
        if hasNextPage {
            var relayPostQuery: PostWithRelayQuery
            if let endCursor = endCursor {
                relayPostQuery = PostWithRelayQuery(first: 10, after: endCursor)
            } else {
                relayPostQuery = PostWithRelayQuery(first: 10)
            }
            DispatchQueue.global(qos: .background).async {
                NetWork.shared.apollo.fetch(query: relayPostQuery) { result in
                    switch result {
                    case .success(let graphQLResult):
                        guard let data = graphQLResult.data
                        else {
                            return
                        }
                        DispatchQueue.main.async {
                            if self.startCursor == nil {
                                self.startCursor = data.postsWithRelay.pageInfo.startCursor
                            }
                            self.posts += data.postsWithRelay.edges.compactMap { $0 }
                            self.endCursor = data.postsWithRelay.pageInfo.endCursor
                            self.hasNextPage = data.postsWithRelay.pageInfo.hasNextPage
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            
        }

    }
}
