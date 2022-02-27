//
//  PostUser.swift
//  gql
//
//  Created by Shaw Young on 2022/2/27.
//

import SwiftUI

struct PostUser: View {
    let numberFormatter = NumberFormatter()
    let creatorAvatarUrl: String?
    let creatorName: String?
    let votes: Int
    let createAtString: String
    
    
    var body: some View {
        HStack(spacing: 0) {
            Label {
                Text(creatorName ?? "小白板")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
            } icon: {
                SDWebImageView(urlString: creatorAvatarUrl ?? "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/anonymous.jpg", width: 23, height: 23)
                    .clipShape(Circle())
            }
            Circle()
                .foregroundColor(Color(#colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)))
                .frame(width: 2, height: 2)
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 7))
            Text(createAtString)
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)))
            Spacer()
            Image(systemName: "bubble.right")
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
            Spacer()
            Label {
                Text("\(votes)")
            } icon: {
                Image(systemName: "hand.thumbsup")
            }
            .font(.caption)

            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 23, alignment: .leading)

//        .background(.gray)
    }
}
