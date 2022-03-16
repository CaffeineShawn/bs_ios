//
//  TestListCell.swift
//  gql
//
//  Created by Shaw Young on 2022/3/3.
//

import SwiftUI

struct TestListCell: View {
    @StateObject var vm = TestListViewModel()
    @State private var offset = CGSize.zero
    @GestureState var imageOffset: CGSize = .zero
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 7), count: 3)
    let size = UIScreen.main.bounds.width/3-28/3
    @Namespace var ns
    var body: some View {
        ZStack {
            ScrollList(ns: ns)
                .environmentObject(vm)
            if vm.showingDetail {
                ZStack {
                    Text("\(vm.currentIndex)")
                        .matchedGeometryEffect(id: "\(vm.currentIndex)", in: ns, isSource: vm.showingDetail ? true : false)
                        .foregroundColor(.red)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .background(Color.black.opacity(0.3).matchedGeometryEffect(id: "bg\(vm.currentIndex)", in: ns,isSource: vm.showingDetail ? true : false))
//                        .onTapGesture {
//                            withAnimation(.easeInOut(duration: 1)) {
//                                vm.onEnded()
//                            }
//                        }
                        .offset(y: vm.offset.height)
                        
                }
                .gesture(
                    DragGesture()
//                        .onChanged({ value in
//                        offset = value.translation
//                        vm.onDrag(value: offset)
//                    })
                        .updating($imageOffset, body: { value, state, _ in
                            state = value.translation
                            vm.onDragChange(offset: state)
                        })
                        .onEnded({ value in
                            if abs(vm.offset.height) > UIScreen.main.bounds.height/8 {
                            withAnimation {
                                vm.onEnded()
                            }
//                            offset = .zero
                            vm.onDragEnded()
                        } else {
                            withAnimation(.spring()) {
                                
//                                offset = .zero
                                vm.onDragEnded()
                            }
                        }
                    })
                )
            }
        }
    }
}

struct ScrollList: View {
    @EnvironmentObject var vm: TestListViewModel
    var ns: Namespace.ID
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 7), count: 3)
    let size = UIScreen.main.bounds.width/3-28/3
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 7) {
                ForEach(0...99, id: \.self) { idx in
                    Text("\(idx)")
                        .matchedGeometryEffect(id: "\(idx)", in: ns, isSource: !vm.showingDetail ? true : false)
                        .foregroundColor(.red)
                        .frame(width: size, height: size)
                        .background(Color.green.opacity(0.3).matchedGeometryEffect(id: "bg\(idx)", in: ns,isSource: !vm.showingDetail ? true : false))
                        .onTapGesture {
                            withAnimation(.default) {
                                vm.onChange(value: idx)
                            }
                            
                        }
                }
            }
            .padding(.horizontal, 7)
        }
        .opacity(vm.showingDetail ? 0 : 1)
    }
}


class TestListViewModel: ObservableObject {
    @Namespace var ns
    @Published var currentIndex = 0
    @Published var showingDetail = false
    @Published var offset = CGSize.zero
    
    func onChange(value: Int) {
        self.showingDetail = false
        self.currentIndex = value
        self.showingDetail = true
        
    }
    
    func onDrag(value: CGSize) {
        self.offset = offset
    }
    
    func onDragChange(offset: CGSize) {
        self.offset = offset
    }
    
    func onDragEnded() {
        self.offset = .zero
    }
    
    func onEnded() {
        self.showingDetail = false
    }
}

struct TextFieldView: UIViewRepresentable {
    
    @Binding var text: String
    var onCommit: (String) -> Void
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .red
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, onCommit: onCommit)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldView
        var onCommit: (String) -> Void
        
        init(_ parent: TextFieldView, onCommit: @escaping (String) -> Void) {
            self.parent = parent
            self.onCommit = onCommit
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.$text.wrappedValue = textField.text ?? ""
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            onCommit(textField.text ?? "")
        }
    }
}


struct TestListCell_Previews: PreviewProvider {
    @State static var text: String = "sbsbsb"
    static var previews: some View {
        TextFieldView(text: $text) { text in
        }
    }
}
