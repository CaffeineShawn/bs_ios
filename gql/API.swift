// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($userId: String!, $sign: String!) {
      login(userId: $userId, sign: $sign) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "login"

  public var userId: String
  public var sign: String

  public init(userId: String, sign: String) {
    self.userId = userId
    self.sign = sign
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "sign": sign]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["userId": GraphQLVariable("userId"), "sign": GraphQLVariable("sign")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    /// 登录
    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "LoginResult", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// token
      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class PostWithRelayQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query postWithRelay($first: Int, $after: String, $last: Int, $before: String) {
      postsWithRelay(first: $first, after: $after, last: $last, before: $before) {
        __typename
        edges {
          __typename
          node {
            __typename
            subject {
              __typename
              id
              description
            }
            content
            images
            creator {
              __typename
              name
              userId
              openId
              avatarImageUrl
            }
            createdAt
            id
            votes {
              __typename
              totalCount
            }
            trendingComments(first: 3) {
              __typename
              nodes {
                __typename
                id
                content
                createdAt
                creator {
                  __typename
                  name
                  userId
                  openId
                  avatarImageUrl
                }
                votes {
                  __typename
                  totalCount
                }
              }
            }
          }
        }
        pageInfo {
          __typename
          startCursor
          endCursor
          hasNextPage
          hasPreviousPage
        }
      }
    }
    """

  public let operationName: String = "postWithRelay"

  public var first: Int?
  public var after: String?
  public var last: Int?
  public var before: String?

  public init(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil) {
    self.first = first
    self.after = after
    self.last = last
    self.before = before
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after, "last": last, "before": before]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("postsWithRelay", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("after"), "last": GraphQLVariable("last"), "before": GraphQLVariable("before")], type: .nonNull(.object(PostsWithRelay.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(postsWithRelay: PostsWithRelay) {
      self.init(unsafeResultMap: ["__typename": "Query", "postsWithRelay": postsWithRelay.resultMap])
    }

    /// Relay分页版的posts接口
    public var postsWithRelay: PostsWithRelay {
      get {
        return PostsWithRelay(unsafeResultMap: resultMap["postsWithRelay"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "postsWithRelay")
      }
    }

    public struct PostsWithRelay: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PostsConnectionWithRelay"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "PostsConnectionWithRelay", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PostEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "PostEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Post"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("subject", type: .object(Subject.selections)),
              GraphQLField("content", type: .nonNull(.scalar(String.self))),
              GraphQLField("images", type: .list(.nonNull(.scalar(String.self)))),
              GraphQLField("creator", type: .object(Creator.selections)),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("votes", type: .nonNull(.object(Vote.selections))),
              GraphQLField("trendingComments", arguments: ["first": 3], type: .nonNull(.object(TrendingComment.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(subject: Subject? = nil, content: String, images: [String]? = nil, creator: Creator? = nil, createdAt: String, id: String, votes: Vote, trendingComments: TrendingComment) {
            self.init(unsafeResultMap: ["__typename": "Post", "subject": subject.flatMap { (value: Subject) -> ResultMap in value.resultMap }, "content": content, "images": images, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }, "createdAt": createdAt, "id": id, "votes": votes.resultMap, "trendingComments": trendingComments.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// 帖子所属的主题
          public var subject: Subject? {
            get {
              return (resultMap["subject"] as? ResultMap).flatMap { Subject(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "subject")
            }
          }

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var images: [String]? {
            get {
              return resultMap["images"] as? [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "images")
            }
          }

          /// 帖子的创建者，当帖子是匿名帖子时，返回null
          public var creator: Creator? {
            get {
              return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "creator")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// 帖子的点赞
          public var votes: Vote {
            get {
              return Vote(unsafeResultMap: resultMap["votes"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "votes")
            }
          }

          /// 按热度返回评论
          public var trendingComments: TrendingComment {
            get {
              return TrendingComment(unsafeResultMap: resultMap["trendingComments"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "trendingComments")
            }
          }

          public struct Subject: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Subject"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, description: String) {
              self.init(unsafeResultMap: ["__typename": "Subject", "id": id, "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }

          public struct Creator: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("userId", type: .nonNull(.scalar(String.self))),
                GraphQLField("openId", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarImageUrl", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, userId: String, openId: String, avatarImageUrl: String) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name, "userId": userId, "openId": openId, "avatarImageUrl": avatarImageUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// 用户昵称
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// 用户账号
            public var userId: String {
              get {
                return resultMap["userId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "userId")
              }
            }

            /// 微信openId,注册时传入微信code自动通过微信提供的接口获取获取
            public var openId: String {
              get {
                return resultMap["openId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "openId")
              }
            }

            /// 用户头像链接
            public var avatarImageUrl: String {
              get {
                return resultMap["avatarImageUrl"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatarImageUrl")
              }
            }
          }

          public struct Vote: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["VotesConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "VotesConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }

          public struct TrendingComment: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CommentsConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node]) {
              self.init(unsafeResultMap: ["__typename": "CommentsConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var nodes: [Node] {
              get {
                return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Comment"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(String.self))),
                  GraphQLField("content", type: .nonNull(.scalar(String.self))),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                  GraphQLField("creator", type: .object(Creator.selections)),
                  GraphQLField("votes", type: .nonNull(.object(Vote.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String, content: String, createdAt: String, creator: Creator? = nil, votes: Vote) {
                self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "content": content, "createdAt": createdAt, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }, "votes": votes.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String {
                get {
                  return resultMap["id"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var content: String {
                get {
                  return resultMap["content"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "content")
                }
              }

              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              /// 评论的创建者，评论是匿名评论时，creator为null
              public var creator: Creator? {
                get {
                  return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "creator")
                }
              }

              /// 获取该评论下的点赞信息
              public var votes: Vote {
                get {
                  return Vote(unsafeResultMap: resultMap["votes"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "votes")
                }
              }

              public struct Creator: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    GraphQLField("userId", type: .nonNull(.scalar(String.self))),
                    GraphQLField("openId", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarImageUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String, userId: String, openId: String, avatarImageUrl: String) {
                  self.init(unsafeResultMap: ["__typename": "User", "name": name, "userId": userId, "openId": openId, "avatarImageUrl": avatarImageUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// 用户昵称
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                /// 用户账号
                public var userId: String {
                  get {
                    return resultMap["userId"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "userId")
                  }
                }

                /// 微信openId,注册时传入微信code自动通过微信提供的接口获取获取
                public var openId: String {
                  get {
                    return resultMap["openId"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "openId")
                  }
                }

                /// 用户头像链接
                public var avatarImageUrl: String {
                  get {
                    return resultMap["avatarImageUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarImageUrl")
                  }
                }
              }

              public struct Vote: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["VotesConnection"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(totalCount: Int) {
                  self.init(unsafeResultMap: ["__typename": "VotesConnection", "totalCount": totalCount])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var totalCount: Int {
                  get {
                    return resultMap["totalCount"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "totalCount")
                  }
                }
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PostPageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startCursor: String? = nil, endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PostPageInfo", "startCursor": startCursor, "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var startCursor: String? {
          get {
            return resultMap["startCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }

        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        public var hasPreviousPage: Bool {
          get {
            return resultMap["hasPreviousPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasPreviousPage")
          }
        }
      }
    }
  }
}

public final class PostQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query post($postId: String!) {
      post(id: $postId) {
        __typename
        subject {
          __typename
          id
          description
        }
        content
        images
        creator {
          __typename
          name
          userId
          openId
          avatarImageUrl
        }
        createdAt
        id
        votes {
          __typename
          totalCount
        }
        trendingComments(first: 3) {
          __typename
          nodes {
            __typename
            id
            content
            createdAt
            creator {
              __typename
              name
              userId
              openId
              avatarImageUrl
            }
            votes {
              __typename
              totalCount
            }
          }
        }
      }
    }
    """

  public let operationName: String = "post"

  public var postId: String

  public init(postId: String) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("post", arguments: ["id": GraphQLVariable("postId")], type: .nonNull(.object(Post.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(post: Post) {
      self.init(unsafeResultMap: ["__typename": "Query", "post": post.resultMap])
    }

    /// 以postId获取一个帖子
    public var post: Post {
      get {
        return Post(unsafeResultMap: resultMap["post"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "post")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("subject", type: .object(Subject.selections)),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("images", type: .list(.nonNull(.scalar(String.self)))),
          GraphQLField("creator", type: .object(Creator.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("votes", type: .nonNull(.object(Vote.selections))),
          GraphQLField("trendingComments", arguments: ["first": 3], type: .nonNull(.object(TrendingComment.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(subject: Subject? = nil, content: String, images: [String]? = nil, creator: Creator? = nil, createdAt: String, id: String, votes: Vote, trendingComments: TrendingComment) {
        self.init(unsafeResultMap: ["__typename": "Post", "subject": subject.flatMap { (value: Subject) -> ResultMap in value.resultMap }, "content": content, "images": images, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }, "createdAt": createdAt, "id": id, "votes": votes.resultMap, "trendingComments": trendingComments.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// 帖子所属的主题
      public var subject: Subject? {
        get {
          return (resultMap["subject"] as? ResultMap).flatMap { Subject(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subject")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var images: [String]? {
        get {
          return resultMap["images"] as? [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      /// 帖子的创建者，当帖子是匿名帖子时，返回null
      public var creator: Creator? {
        get {
          return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "creator")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 帖子的点赞
      public var votes: Vote {
        get {
          return Vote(unsafeResultMap: resultMap["votes"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "votes")
        }
      }

      /// 按热度返回评论
      public var trendingComments: TrendingComment {
        get {
          return TrendingComment(unsafeResultMap: resultMap["trendingComments"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "trendingComments")
        }
      }

      public struct Subject: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subject"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "Subject", "id": id, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("userId", type: .nonNull(.scalar(String.self))),
            GraphQLField("openId", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatarImageUrl", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, userId: String, openId: String, avatarImageUrl: String) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "userId": userId, "openId": openId, "avatarImageUrl": avatarImageUrl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// 用户昵称
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// 用户账号
        public var userId: String {
          get {
            return resultMap["userId"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        /// 微信openId,注册时传入微信code自动通过微信提供的接口获取获取
        public var openId: String {
          get {
            return resultMap["openId"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openId")
          }
        }

        /// 用户头像链接
        public var avatarImageUrl: String {
          get {
            return resultMap["avatarImageUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatarImageUrl")
          }
        }
      }

      public struct Vote: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VotesConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "VotesConnection", "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }

      public struct TrendingComment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CommentsConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "CommentsConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Comment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("content", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("creator", type: .object(Creator.selections)),
              GraphQLField("votes", type: .nonNull(.object(Vote.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, content: String, createdAt: String, creator: Creator? = nil, votes: Vote) {
            self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "content": content, "createdAt": createdAt, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }, "votes": votes.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// 评论的创建者，评论是匿名评论时，creator为null
          public var creator: Creator? {
            get {
              return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "creator")
            }
          }

          /// 获取该评论下的点赞信息
          public var votes: Vote {
            get {
              return Vote(unsafeResultMap: resultMap["votes"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "votes")
            }
          }

          public struct Creator: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("userId", type: .nonNull(.scalar(String.self))),
                GraphQLField("openId", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarImageUrl", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, userId: String, openId: String, avatarImageUrl: String) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name, "userId": userId, "openId": openId, "avatarImageUrl": avatarImageUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// 用户昵称
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// 用户账号
            public var userId: String {
              get {
                return resultMap["userId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "userId")
              }
            }

            /// 微信openId,注册时传入微信code自动通过微信提供的接口获取获取
            public var openId: String {
              get {
                return resultMap["openId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "openId")
              }
            }

            /// 用户头像链接
            public var avatarImageUrl: String {
              get {
                return resultMap["avatarImageUrl"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatarImageUrl")
              }
            }
          }

          public struct Vote: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["VotesConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "VotesConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }
    }
  }
}
