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

    @State private var messages : [String] = ["Led Zeppelin IV", "Random Access Memories", "Dirt", "American Football", "Revolver","Van Halen", "Raise!", "Dookie", "Wish You Were Here", "Who's Next" ]
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
                .multilineTextAlignment(.center)
            Spacer()
            HStack{
                
                Button("Press Me!") {
                    
                    message = messages[counter]
                    counter += 1
                    if counter == messages.count {
                        counter = 0
                    }
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    if imageNumber > 9 {
                        imageNumber = 0
                        
                    }
                    
                    
                    
                    
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
