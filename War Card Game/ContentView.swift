//
//  ContentView.swift
//  War Card Game
//
//  Created by Ammar Haider on 1/25/26.
//

import SwiftUI

struct ContentView: View {
    @State var playerWon = false
    @State var cpuWon = false
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            Image("game-screen")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            
            VStack (spacing: 10){
                //cards
                HStack (spacing: 50){
                    Image(playerCard)
                    Image(cpuCard)
                }
                
                //button
                Button {
                    dealCards()
                } label: {
                    Image("deal-button").resizable().scaledToFit().frame(width: 200)
                }
                
                //scores
                HStack (spacing: 50){
                    
                    //player scores
                    VStack (spacing: 10){
                        Text("Player")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)
                        Text(String(playerScore))
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)
                    }
                    
                
                    //cpu scores
                    VStack (spacing: 10){
                        Text("CPU")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2 )
                        
                        Text(String(cpuScore))
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)
                    }
                }
            }
        }
        .navigationDestination(isPresented: $playerWon){
            WinView()
        }
        .navigationDestination(isPresented: $cpuWon){
            LoseView()
        }
        
    }
    
    func calcState() {
        if playerScore >= 21 {
            playerWon = true
        } else if cpuScore >= 21 {
            cpuWon = true
        }
    }
    func dealCards() {
        //randomizes the cards
        let pValue = Int.random(in: 2...14)
        let cValue = Int.random(in: 2...14)
        
        //updates the card images
        playerCard = "card" + String(pValue)
        cpuCard = "card" + String(cValue)
        
        //calculates the score
        //updates the scores labels
        if pValue > cValue {
            playerScore += 1
        } else if cValue > pValue {
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }
        
        calcState()
    }
}

#Preview {
    ContentView()
}
