//
//  PostCell.swift
//  gql
//
//  Created by Shaw Young on 2022/2/27.
//

import SwiftUI

struct PostCell: View {
    let post: PostWithRelayQuery.Data.PostsWithRelay.Edge.Node

    var body: some View {
        VStack {
            if let post = post {
                VStack {
                    Text(post.content)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 23)
                        .padding(.top, 18)
                    
                    if let images = post.images {
                        SDGridImageView(images: images)
                            .padding(.horizontal, 16)
                    }
                    if let id = post.subject?.id {
                        HStack {
                            Group {
                                switch id {
                                case "0x19198":
                                    Label {
                                        Text("1px life")
                                            .fontWeight(.bold)
                                    } icon: {
                                        Image(systemName: "message")
                                    }
                                    .font(.caption)
                                default:
                                    Label {
                                        Text("拜托了!白板")
                                            
                                            .fontWeight(.bold)
                                    } icon: {
                                        Image(systemName: "message")
                                    }
                                    .font(.caption)
                                }
                            }
                            .frame(width: 100, alignment: .leading)
                            .foregroundColor(Color("SubjectTextColor"))
                            .padding(.horizontal, 7)
                            .padding(.vertical, 7)
                            .background(Color("SubjectBackgroundColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            Spacer()
                        }
                        .padding(.top, 3)
                        .padding(.horizontal, 27)
                    }
                   
                    
                    PostUser(creatorAvatarUrl: post.creator?.avatarImageUrl , creatorName: post.creator?.name, votes:post.votes.totalCount, createAtString: JsonDateFormatter.timeDiffFromNow(previousDate: JsonDateFormatter.shared.instance.date(from: post.createdAt)!))
                        .padding(.horizontal, 27)
                        
                        
                   
                }
            } else {
                ProgressView()
//                    .onAppear {
//                        singlePostLoader.fetch(postId: postId)
//                    }
            }
        }
        .background(.white, in: RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 12)
        
        
    }
}
