//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Bradshaw on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var counter = 0

    @State private var messages : [String] = ["Led Zeppelin IV", "Random Access Memories by Daft Punk, featuring Pharrell Williams", "Dirt", "American Football", "Revolver","Van Halen", "Raise!", "Dookie", "Wish You Were Here", "Who's Next" ]
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15),value:message)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 20)
                .animation(.default,value:imageName)
            
            Spacer()
            HStack{
                
                Button("Show Message") {
                    counter = Int.random(in: 0..<messages.count)
                    message = messages[counter]
                    imageName = "image\(Int.random(in: 0...9))"
                    
                    
                    
                    
                    
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
