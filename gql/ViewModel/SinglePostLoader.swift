//
//  SinglePostLoader.swift
//  gql
//
//  Created by Shaw Young on 2022/2/26.
//

import Foundation

final class SinglePostLoader: ObservableObject {
    @Published var post: PostQuery.Data.Post? = nil
    @Published var loading: Bool = false
    @Published var error: String? = nil
    
    
    func fetch(postId: String) {
        loading = true
        NetWork.shared.apollo.fetch(query: PostQuery(postId: postId)) { res in
            switch res {
            case .success(let response):
                self.post = response.data?.post
                self.loading = false
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
}
