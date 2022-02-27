//
//  CustomNavigationView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/25.
//

import SwiftUI

struct CustomNavigationView<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationBarHidden(true)
        }
        
        
    }
}


struct CustomNavBarView: View {
    
    @State private var activeLeftItem: Bool = false
    @State private var title: String = ""
    
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(spacing: 4) {
                Text("BlackSpace")
                    .fontWeight(.bold)
            }
            .padding()
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            .opacity(0)
        }
        .padding(.horizontal)
        .background(.ultraThinMaterial)

    }
}

//struct CustomNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(spacing: 0) {
//     CustomNavigationView() {
//                List {
//                    ForEach(0..<100) {_ in
//                        Text("SB")
//                            .frame(maxWidth: .infinity)
//                            
//                    }.background(Color.blue)
//                }
//                .padding(.top, 40)
//            }
//            .overlay {
//                VStack {
//                    CustomNavBarView()
//                        
//                    Spacer()
//                }
//                            
//            }
//            
//        }
//    }
//}
