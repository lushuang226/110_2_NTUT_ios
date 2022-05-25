//
//  SongDetail.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/10.
//

import SwiftUI

struct SongDetail: View {
    let song: Song

    var body: some View {
        VStack {
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 300)
                .clipped()
            Text(song.lyrics)
                .padding()
            }
            .navigationTitle(song.name)
        }
    }


struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: songs[0])
    }
}
