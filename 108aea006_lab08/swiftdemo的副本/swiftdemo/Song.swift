//
//  Song.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/10.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let singer: String
    let lyrics: String
}

let songs = [
Song(name: "對的時間點", singer: "林俊傑", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈⼦ 也要走向前 不離⼼太遠 我要⾯朝最藍的晴天 不脫離軌道有你在⾝邊"),
Song(name: "說好不哭", singer: "周杰倫", lyrics: "沒有了聯絡後來的⽣活 我都是聽別⼈說 說妳怎麼了 說妳怎麼過 放不下的⼈是我 ⼈多的時候 就待在⾓落 就怕別⼈問起我 你們怎麼了 妳低著頭 護著我連抱怨都沒有")
]
