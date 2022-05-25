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
    @State var isRain = true
    @State private var bbb :CGFloat = 1
    @State private var name = ""
    @State private var age = 0
    @State private var guessnumberString = ""
    @State private var showAlert = false
    var roles = ["李白", "李嘉誠", "彼得潘", "奇妙仙子"]
    @State private var selectedIndex = 0
    @State private var birthday = Date()
    var body: some View {
         VStack {
              Image(systemName: isRain ? "cloud.rain.fill" : "sun.max.fill")
                  .resizable()
                  .frame(width: 100, height: 100)
                  .blur(radius: bbb)
              Text(isRain ? "Sad" : "Happy")
                .alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("name:\(name)"))
                }
              Toggle(isOn: $isRain, label: {
                  Text("Sad ?")
              })

                Slider(value: $bbb, in: 1...30)
                TextField("你的名字", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("印出名字") {
                    showAlert = true
                }
                Stepper("age : \(age)",value: $age,in:1...30)
                Picker(selection: $selectedIndex, label: Text("選擇角色")) {
                    ForEach(roles.indices) { (index) in
                       Text(roles[index])
                    }
                }
            DatePicker("birthday",selection:$birthday).padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
