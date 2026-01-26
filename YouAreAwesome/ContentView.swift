//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Bradshaw on 1/15/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var counter = 0
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
    @State private var counter2 = 0
    let numberOfImages = 9
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    let numberofSounds = 6
    
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
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 20)
                .animation(.default,value:imageName)
            
            Spacer()
            HStack{
                
                Button("Show Message") {
                    
                    repeat{
                        counter = Int.random(in: 0..<messages.count)
                        
                    }while counter == lastMessageNumber
                    lastMessageNumber = counter
                    message = messages[counter]
                    repeat{
                        counter2 = Int.random(in: 0...numberOfImages)
                    } while counter2 == lastImageNumber
                    lastImageNumber = counter2
                    imageName = "image\(counter2)"
                    
                    var soundNumber: Int
                    repeat{
                        soundNumber = Int.random(in: 0...numberofSounds-1)
                    } while soundNumber == lastSoundNumber
                    lastSoundNumber = soundNumber
                    let soundName = "sound\(soundNumber)"
                    
                    guard let soundFile = NSDataAsset(name: soundName) else{
                        print("🤬 Could not read file named \(soundName)")
                        return
                    }
                    do{
                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
                        audioPlayer.play()
                    } catch {
                        print("Error: \(error.localizedDescription) creating audioPlayer.")
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
