//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Bradshaw on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var check = 0
    @State private var imageName = ""
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            Spacer()
            HStack{
                
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageName1 = "sun.max.fill"
                    let imageName2 = "hand.thumbsup"
                    message = (message == message1 ? message2 : message1)
                    imageName = (imageName == imageName1 ? imageName2 : imageName1)
                    
                    
                    
                    
                }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
            }
            .padding()
        }
    }
    
    #Preview {
        ContentView()
    }
