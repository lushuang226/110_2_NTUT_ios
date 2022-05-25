//
//  SongList.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/10.
//

import SwiftUI

struct SongList: View {

    
    var body: some View {
        NavigationView {
            List(songs) { song in
                NavigationLink(
                    destination: SongDetail(song: song),
                    label: {
                        SongRow(song: song)
                })
            }
            .navigationTitle("情歌王")
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
