//
//  ContentView.swift
//  2020_iOS_bonus1
//
//  Created by Hannn on 2020/4/7.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var result : Int = 1
    @State private var schedule = ["你贏了！","你輸了QQ","ㄏㄚˋ！平手拉～"]
    @State private var pic = ["scissors", "rock", "paper"]
    @State private var showAlert = false
    @State private var user = 1
    @State private var computer = 1
    
    var body: some View {
        
        ZStack{
            
            Image("main")
                .resizable()
                .frame(width:350, height:350)
                .offset(x:0, y:-250)
            
            Image(pic[computer-1])
                .resizable()
                .frame(width:250, height:250)
                .background(Color.white)
                .clipShape(Circle())
                .offset(x:0, y:20)
            
            ZStack{
                Text("你要出什麼？")
                    .font(.system(size: 30))
                    .offset(x: 0, y: -100)
                
                Button(action:{
                    let randNum = 1...3
                    self.computer = randNum.randomElement()!
                    self.showAlert = true
                    self.user = 1
                }){
                    Text("✌️")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(50)
                }.offset(x:-135, y:0)
                
                Button(action:{
                    let randNum = 1...3
                    self.computer = randNum.randomElement()!
                    self.showAlert = true
                    self.user = 2
                }){
                    Text("✊")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(50)
                }
                
                Button(action:{
                    let randNum = 1...3
                    self.computer = randNum.randomElement()!
                    self.showAlert = true
                    self.user = 3
                }){
                    Text("🖐")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(50)
                }.offset(x:135, y:0)
                
            }.offset(x:0, y:320)
                .alert(isPresented: $showAlert) { () -> Alert in
                    if(self.user == self.computer){
                        return Alert(title: Text("遊戲結果："), message:Text("ㄏㄚˋ！平手拉～"),dismissButton: .destructive(Text("Play Again")))
                    }
                    else if((self.user == 2 && self.computer == 1) || (self.user == 1 && self.computer == 3) || (self.user == 3 && self.computer == 2)){
                        return Alert(title: Text("遊戲結果："), message:Text("你贏了！"),dismissButton: .destructive(Text("Play Again")))
                    }
                    
                    return Alert(title: Text("遊戲結果："), message:Text("你輸了QQ"),dismissButton: .destructive(Text("Play Again")))
            }
            
        }
        .background(Color(red:158/255, green:158/255, blue:158/255)
        .edgesIgnoringSafeArea(.all)
        .frame(width:500,height:1000)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
