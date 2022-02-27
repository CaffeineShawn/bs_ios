//
//  CommentCell.swift
//  gql
//
//  Created by Shaw Young on 2022/2/27.
//

import SwiftUI

struct CommentCell: View {
    let creatorAvatarUrl: String?
    let creatorName: String?
    let content: String
    let votes: Int
    let createAtString: String
    
    var body: some View {
        VStack {
              Text(content)
                  .padding(.top, 14)
                  .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
                  .font(.caption)
                  .frame(maxWidth: .infinity, alignment: .leading)
              PostUser(
                creatorAvatarUrl: creatorAvatarUrl,
                creatorName: creatorName,
                votes: votes,
                createAtString: createAtString
              )
                .padding(.bottom, 14)
          }
        .padding(.horizontal, 14)
        .background(Color.gray.opacity(0.07))
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.yellow
//            CommentCell()
//                .padding(.horizontal, 12)
//                .frame(height: 300)
//        }
//
//    }
//}
