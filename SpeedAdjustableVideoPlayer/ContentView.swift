//
//  ContentView.swift
//  SpeedAdjustableVideoPlayer
//
//  Created by littleossa on 2022/08/17.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    let url = Bundle.main.url(forResource: "sample",
                              withExtension: "mp4")!
    
    var body: some View {
        SpeedAdjustableVideoPlayer(player: AVPlayer(url: url))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
