//
//  ContentView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
           InfinityPostsView()
//            SDWebImageView(urlString: "https://dev-1306842204.cos.ap-guangzhou.myqcloud.com/defaultAvatars/male.jpg?imageMogr2/format/webp")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
