//
//  UPDATESampleView.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//

import SwiftUI

struct UPDATESampleView: View {
    @State private var name = "Ryder"
    @State private var job = "Engineer"
    
    @State var user :UserUpdateResponse = UserUpdateResponse(name: "*****", job: "*****", updatedAt: nil)
    
    var body: some View {
        NavigationView {
            VStack {
                List(){
                    Text("UPDATE sample")
                    Section(header: Text("Request Data")) {
                        TextField("Name: ", text: $name)
                        TextField("Job: ", text: $job)
                    }
                }
                List() {
                    Section(header: Text("Response Data")) {
                        Text("Name: \(user.name)")
                        Text("Job: \(user.job)")
                        Text("Date updated: \(user.modifiedUpdateAt)")
                    }
                }
                .listStyle(GroupedListStyle())
                Button {
                    UserURLSession.shared.userUpdateRequest(userRequestBody: UserRequestBody(name: name, job: job)) { newUser in
                        DispatchQueue.main.async {
                            user = newUser
                        }
                    }
                    
                } label: {
                    Text("UPDATE Request")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(8)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("URLSession UPDATE Sample"))
        }
        
    }
}

struct UPDATESampleView_Previews: PreviewProvider {
    static var previews: some View {
        UPDATESampleView()
    }
}
