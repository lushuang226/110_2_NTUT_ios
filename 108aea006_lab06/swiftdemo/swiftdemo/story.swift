//
//  story.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/5.
//

import SwiftUI

struct story: View {
    @Binding var showStory: Bool
    let storys = ["漩涡鸣人，日本漫画《火影忍者》及其衍生作品中的男主角。火之国木叶隐村的忍者，第四代火影波风水门和漩涡玖辛奈之子，六道仙人次子阿修罗的查克拉转世者。成为忍者后，和旗木卡卡西、宇智波佐助以及春野樱组成第七班进行各种任务。为实现梦想，和守护伙伴们的羁绊，鸣人不断修炼变强","作为木叶“三忍”之一自来也的弟子，在追求梦想的过程中不断突破自我，贯彻了自身的忍道，获得人们的认可。最后与忍者联军以及宇智波佐助还有九尾一同终结了战争，为忍者世界带来和平，并实现自己成为火影（第七代火影）和忍界英雄的梦想。"]
    var body: some View {

        ZStack(alignment: .center) {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack{
                ForEach(storys.indices) { index in
                    Text(storys[index])
                }
            }
        }
        .overlay(
            Button(action: {
                showStory = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }), alignment: .topTrailing)
    }
}

struct story_Previews: PreviewProvider {
    static var previews: some View {
        story(showStory: .constant(true))
    }
}
