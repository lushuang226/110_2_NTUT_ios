//
//  ContentView.swift
//  swiftdemo
//
//  Created by LINN on 2021/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showSecondPage = false
    @State private var showStory = false

    var body: some View {
        
        VStack(alignment: .center) {
            
            Image("Naruto")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
                .shadow(radius: 20)
            
            Button(action: {
                showSecondPage = true
            }, label: {
                Text("author")
            })
            .fullScreenCover(isPresented: $showSecondPage, content: {SwiftUIView(showSecondPage: $showSecondPage)}
            )
            
            Button(action: {
                showStory = true
            }, label: {
                Text("story")
            })
            .fullScreenCover(isPresented: $showStory, content: {story(showStory: $showStory)}
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
