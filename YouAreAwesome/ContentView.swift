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
                Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 20)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            HStack{
                
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageName1 = "image0"
                    let imageName2 = "image1"
                    message = (message == message1 ? message2 : message1)
                    imageName = (imageName == imageName1 ? imageName2 : imageName1)
                    
                    
                    
                    
                }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .padding()
        }
    }
    
    #Preview {
        ContentView()
    }
