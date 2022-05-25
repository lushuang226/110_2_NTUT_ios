//
//  AppView.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/10.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            SongList()
                .tabItem {
                    Image(systemName: "music.house.fill")
                    Text("情歌")
            }
            ContentView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
            }
        }.accentColor(.orange)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
