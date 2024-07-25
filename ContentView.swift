//
//  ContentView.swift
//  War Card Game
//
//  Created by Target Integration on 07/07/23.
//

import SwiftUI

struct ContentView: View {
   
        @State var playerCard = "card3"
        @State var cpuCard = "card4"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var a = false
    var body: some View {
        ZStack{
            Image("background-plain")
            
            VStack{
                Spacer()
                Image("logo")
                    .padding(.top, 10.0)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button{
                    deal()
                } label: {
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(String(playerScore))
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(String(cpuScore))
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    Spacer()
                }
                Button(action: {
                    a = true;
                  
                    
                }, label: {
                    Text("Reset")
                        .font(.headline)
                        .frame(width: 80,height: 30)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                })
       
                .padding(.bottom, 20.0)
                Spacer()
            }
        }.alert("Are you Sure?",isPresented: $a){
            Button("Yes", role: .destructive){
//                closeApp()
                playerScore = 0;
                cpuScore = 0;
            }
            Button("No", role: .cancel){}
        }
        
        
    }
    
//    func closeApp(){
//        let c = 1
//
//        assert(c == 0)
//    }
    func deal(){
        //Randomise the player card
        @State var playervalue = Int.random(in: 2...14)
        @State var cpuvalue = Int.random(in: 2...14)
        playerCard = "card" + String(playervalue)
        
        //Randomise the cpu card
        cpuCard = "card" + String(cpuvalue)
        //update the score
        if playervalue>cpuvalue{
            playerScore = playerScore+1;
        }else if(playervalue<cpuvalue){
            cpuScore = cpuScore+1;
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

