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
                        .font(.caption)
                        .foregroundColor(Color(hex: "#3E3E3E"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 23)
                        .padding(.top, 18)
                    if let images = post.images {
                        SDGridImageView(images: images)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 7)
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
                                case "0x1ae65":
                                    Label {
                                        Text("板上钉钉")
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
                            .frame(alignment: .leading)
                            .foregroundColor(Color("SubjectTextColor"))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(Color("SubjectBackgroundColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            Spacer()
                        }
                        .padding(.bottom, 7)
                        .padding(.horizontal, 23)
                    }
                    PostUser(creatorAvatarUrl: post.creator?.avatarImageUrl , creatorName: post.creator?.name, votes:post.votes.totalCount, createAtString: JsonDateFormatter.timeDiffFromNow(previousDate: JsonDateFormatter.shared.extractDateFromString(createAt: post.createdAt)) ?? "一星期前")
                        .padding(.horizontal, 27)
                        .padding(.bottom, 7)
                    if let comments = post.trendingComments.nodes {
                        Group {
                            VStack(spacing: 0) {
                                ForEach(comments, id: \.id) { comment in
                                    CommentCell(creatorAvatarUrl: comment.creator?.avatarImageUrl, creatorName: comment.creator?.name, content: comment.content, votes: comment.votes.totalCount, createAtString: JsonDateFormatter.timeDiffFromNow(previousDate: JsonDateFormatter.shared.extractDateFromString(createAt: comment.createdAt)) ?? "一星期前")
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal, 14)
                        .padding(.bottom, 14)
                    }
                }
            } else {
                ProgressView()
//                    .onAppear {
//                        singlePostLoader.fetch(postId: postId)
//                    }
            }
        }
        .background(.white, in: RoundedRectangle(cornerRadius: 10))
//        .padding(.horizontal, 12)
        
        
    }
}
