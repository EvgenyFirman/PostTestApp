//
//  ContentView.swift
//  PostApp
//
//  Created by Евгений Фирман on 27.05.2021.
//

import SwiftUI

struct ContentView: View {

    

    @ObservedObject var networkModal = NetworkModal()
   
    var body: some View {
        NavigationView{
            List(networkModal.posts){ post in
                NavigationLink(
                    destination: Text("Hi"),
                    label: {
                        Text(post.id)
                        Text(post.author.name)
                    })
            }.navigationBarTitle("Post App")
            
        }.onAppear(perform: {
            self.networkModal.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
