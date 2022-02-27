//
//  Apollo.swift
//  gql
//
//  Created by Shaw Young on 2022/2/26.
//

import Foundation
import Apollo

class NetWork {
    static let shared = NetWork()
    
    lazy var apollo = ApolloClient.init(url: URL(string: "https://api.szlikeyou.com/graphql/")!)
}
