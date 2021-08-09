//
//  PostSampleView.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//
import SwiftUI

struct POSTSampleView: View {
    
    @State private var name = "Ryder"
    @State private var job = "Engineer"
    
    @State var user :UserPostResponse = UserPostResponse(name: "*****", job: "*****", id: nil, dateCreated: nil)
    
    var body: some View {
        NavigationView {
            VStack {
                List(){
                    Text("POST sample")
                    Section(header: Text("Request Data")) {
                        TextField("Name: ", text: $name)
                        TextField("Job: ", text: $job)
                    }
                }
                List() {
                    Section(header: Text("Response Data")) {
                        Text("Name: \(user.name)")
                        Text("Job: \(user.job)")
                        Text("ID: \(user.modifiedId)")
                        Text("Date created: \(user.modifiedDateCreated)")
                    }
                }
                .listStyle(GroupedListStyle())
                Button {
                    UserURLSession.shared.userPostRequest(userRequestBody: UserRequestBody(name: name, job: job)) { newUser in
                        DispatchQueue.main.async {
                            user = newUser
                        }
                    }
                    
                } label: {
                    Text("POST Request")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(8)
                
            }            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("URLSession POST Sample"))
        }
        
    }
}

struct POSTSampleView_Previews: PreviewProvider {
    static var previews: some View {
        POSTSampleView()
    }
}
