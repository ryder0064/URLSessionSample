//
//  GETSampleView.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//

import SwiftUI

struct GETSampleView: View {
    @State private var users: [User] = []

    var body: some View {
        NavigationView {
            VStack {
                Button {
                    UserURLSession.shared.userGetRequest(page: 1) { response in
                        DispatchQueue.main.async {
                            users = response.data
                        }
                    }

                } label: {
                    Text("GET Request")
                }
                ScrollView {
                    LazyVStack {
                        ForEach(users, id: \.self) { user in
                            UserItemView(user: user)
                        }
                    }
                }
                .cornerRadius(8)
                
            }            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("URLSession GET Sample"))
        }
    }
}

struct GETSampleView_Previews: PreviewProvider {
    static var previews: some View {
        GETSampleView()
    }
}
