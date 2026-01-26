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
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var counter2 = 0
    let numberOfImages = 9
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    let numberofSounds = 6
    @State private var soundIsOn = true
    
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
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn){
                        if audioPlayer != nil && audioPlayer.isPlaying{
                            audioPlayer.stop()
                        }
                    }
                
                Button("Show Message") {
                    lastMessageNumber = nonRepeatingRandom(lastNumber:lastMessageNumber, upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages)
                    imageName = "image\(lastImageNumber)"
                    if soundIsOn == true{
                        lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberofSounds)
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                    
                    
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    func playSound(soundName: String){
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
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
    func nonRepeatingRandom(lastNumber: Int,upperBounds: Int) -> Int {
        var number: Int
        repeat{
            number = Int.random(in: 0...upperBounds)
        } while lastNumber == number
        return number
        
    }
}


#Preview {
    ContentView()
}
