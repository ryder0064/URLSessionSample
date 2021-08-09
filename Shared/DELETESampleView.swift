//
//  DELETESampleView.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//

import SwiftUI

struct DELETESampleView: View {
    @State private var response = ""

    var body: some View {
        NavigationView {
            VStack {
                
                Button {
                    UserURLSession.shared.userDeleteRequest(id: 2) { response in
                        DispatchQueue.main.async {
                            self.response = response
                        }
                    }

                } label: {
                    Text("DELETE Request")
                }
                Text("response: \(response)")
     }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("URLSession DELETE Sample"))
        }
    }
}

struct DELETESampleView_Previews: PreviewProvider {
    static var previews: some View {
        DELETESampleView()
    }
}
