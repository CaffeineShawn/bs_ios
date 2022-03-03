//
//  URLCharacterEscaping.swift
//  gql
//
//  Created by Shaw Young on 2022/3/2.
//

import Foundation
extension String {
    func escapeChinese() -> String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
