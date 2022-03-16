//
//  ContentView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var text = ""
    var body: some View {
        NavigationView {
           InfinityPostsView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        }
//        TestListCell()
//
//        TextFieldView(text: $text) { text in
//            print(text)
//        }
//    }
        

    
}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
