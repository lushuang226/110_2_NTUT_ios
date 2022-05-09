//
//  SwiftUIView.swift
//  swiftdemo
//
//  Created by LINN on 2021/5/3.
//


import SwiftUI

struct SwiftUIView: View {
    @Binding var showSecondPage: Bool
    let authors = ["岸本齐史，1974年11月8日，出生在冈山县胜田郡奈义町，日本著名漫画家，岸本圣史的双胞胎哥哥。《火影忍者》之父。","岸本齐史的代表作《火影忍者》拥有极高的人气，日本集英社《周刊少年JUMP》强力台柱之一。"]
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("anben")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                    .shadow(radius: 20)
                
                ForEach(authors.indices) { index in
                    Text(authors[index])
                }
            }
            
        }.overlay(
                Button(action: {
                    showSecondPage = false
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(20)
//            })
//                .fullScreenCover(isPresented: $showSecondPage, content: {
//                    ContentView()
                }), alignment: .topTrailing)
        }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(showSecondPage: .constant(true))
    }
}

