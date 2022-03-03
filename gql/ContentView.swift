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
//        ScrollView {
//            
//            View1()
//        }
//    }
        
        

    
}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct View1: View {
    @ObservedObject var vm = ViewModel()
    @Namespace var ns
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 7), count: 3)
    var body: some View {
        ZStack {
            if vm.showingDetailView {
                View2().environmentObject(vm)
                    
            }
                    
                
            LazyVGrid(columns: gridItems, spacing: 7) {
                ForEach(0...99, id:\.self) { idx in
                    Text("\(idx)")
                        .matchedGeometryEffect(id: "text\(idx)", in: ns)
                        .frame(width: (UIScreen.main.bounds.width-14)/3-14/3,height: UIScreen.main.bounds.width/3-14/3)
                        .background(Color.red)
//                        .matchedGeometryEffect(id: "bg", in: ns)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            withAnimation {
                                vm.showingIdx = idx
                                vm.showingDetailView.toggle()
                            }
                        }
                }
                
            }
            .zIndex(-1)
            .padding(.horizontal, 7)
        }
    }
}

struct View2: View {
    @EnvironmentObject var vm: ViewModel
    @Namespace var ns
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea().zIndex(99)
            Text("\(vm.showingIdx)")
                .foregroundColor(.white)
                .matchedGeometryEffect(id: "text\(vm.showingIdx)", in: ns)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.blue)
                .zIndex(100)
                .onTapGesture {
                    vm.showingDetailView.toggle()
                }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    }
}

class ViewModel: ObservableObject {
    @Published var showingDetailView = false
    @Published var showingIdx = 0
    @Namespace var ns
}
