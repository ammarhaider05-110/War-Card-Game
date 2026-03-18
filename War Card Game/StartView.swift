//
//  StartView.swift
//  War Card Game
//
//  Created by Ammar Haider on 3/12/26.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("home-screen")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
                VStack{
                    NavigationLink{
                        ContentView()
                    } label:{
                        Image("start-button")
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
    StartView()
}
