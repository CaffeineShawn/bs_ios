//
//  LoginView.swift
//  gql
//
//  Created by Shaw Young on 2022/2/21.
//

import SwiftUI

struct LoginView: View {
    @State private var userId: String = ""
    @State private var sign: String = ""
    @State private var loginSuccess: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    HStack {
                        Text("账号")
                        TextField("userId", text: $userId)
                            .textInputAutocapitalization(TextInputAutocapitalization?.none)
                            .padding(20)
                    }
                    HStack {
                        Text("密码")
                        TextField("sign", text: $sign)
                            .textInputAutocapitalization(TextInputAutocapitalization?.none)
                            .padding(20)
                    }

                }
                .padding(20)
                Button {
                    print("login")
                    NetWork.shared.apollo.perform(mutation: LoginMutation(userId: userId, sign: sign)) { result in
                        switch result {
                        case .success(let graphQLResult):
                            print(graphQLResult.data?.login.token ?? "Unknown Response")
                            UserDefaults.standard.set(graphQLResult.data?.login.token , forKey:"token")
                            loginSuccess = true
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                    
                } label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(20)

            }
            .navigationTitle("Admin Login")
            
        }
        .fullScreenCover(isPresented: $loginSuccess, content: InfinityPostsView.init)
        
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
