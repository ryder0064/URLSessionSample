//
//  ContentView.swift
//  Shared
//
//  Created by 陳耀奇 on 2021/8/4.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: POSTSampleView(),
                    label: {
                        Text("POST SAMPLE")
                    })
                NavigationLink(
                    destination: GETSampleView(),
                    label: {
                        Text("GET SAMPLE")
                    })
                NavigationLink(
                    destination: DELETESampleView(),
                    label: {
                        Text("DELETE SAMPLE")
                    })
                NavigationLink(
                    destination: UPDATESampleView(),
                    label: {
                        Text("UPDATE SAMPLE")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
