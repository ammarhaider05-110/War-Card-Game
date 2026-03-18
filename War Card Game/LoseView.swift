//
//  LoseView.swift
//  War Card Game
//
//  Created by Ammar Haider on 3/17/26.
//

import SwiftUI

struct LoseView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("win-screen")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
                VStack{
                    NavigationLink{
                        ContentView()
                    } label:{
                        Image("playagain-button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .offset(x: -10)
                    }
                }
            }
        }
    }
}

#Preview {
    LoseView()
}
