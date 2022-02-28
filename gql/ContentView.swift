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
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
