//
//  SongRow.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/10.
//

import SwiftUI

struct SongRow: View {
    let song: Song
    var body: some View {
        HStack {
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.singer)
            }
            Spacer()
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(name: "對的時間點", singer: "林俊傑", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈⼦ 也要走向前 不離⼼太遠 我要⾯朝最藍的晴天 不脫離軌道有你在⾝邊"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
