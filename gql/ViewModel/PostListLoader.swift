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
    @Published var endCursor: String? = nil
    @Published var hasNextPage: Bool = true
    
    init() {}
    
    func fetchPost() -> Cancellable? {
        if hasNextPage {
            var relayPostQuery: PostWithRelayQuery
            if let endCursor = endCursor {
                relayPostQuery = PostWithRelayQuery(first: 10, after: endCursor)
            } else {
                relayPostQuery = PostWithRelayQuery(first: 10)
            }
            return NetWork.shared.apollo.fetch(query: relayPostQuery) { result in
                switch result {
                case .success(let graphQLResult):
                    guard let data = graphQLResult.data
                    else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.posts += data.postsWithRelay.edges.compactMap { $0 }
                        self.endCursor = data.postsWithRelay.pageInfo.endCursor
                        self.hasNextPage = data.postsWithRelay.pageInfo.hasNextPage
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            return nil
        }

    }
}
