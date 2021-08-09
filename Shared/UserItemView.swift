//
//  UserItemView.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//

import SwiftUI

struct UserItemView: View {
    var user : User
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            //Image
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 80.0, height: 80.0, alignment: .center)
                .foregroundColor(.blue)
                .padding(.all, 20)
            
            VStack(alignment: .leading, spacing: 5, content: {
                HStack{
                    Text("First Name :")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)

                    Text("\(user.firstName)")                        .foregroundColor(.blue)
                }
                
                HStack{
                    Text("Last Name :")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .bold()
                    Text("\(user.lastName)")                        .foregroundColor(.blue)

                }
                
                HStack{
                    Text("Email :")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    Text("\(user.email)")
                        .foregroundColor(.blue)
                }
                
            })
            .foregroundColor(.white)
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct UserItemView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 1, email: "george.bluth@reqres.in", firstName: "George", lastName: "Bluth", avatar: "https://reqres.in/img/faces/1-image.jpg")
        UserItemView(user: user)
            .previewLayout(.fixed(width: 375.0, height: 100.0))
    }
}
