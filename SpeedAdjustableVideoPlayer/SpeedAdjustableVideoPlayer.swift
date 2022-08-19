//
//  SpeedAdjustableVideoPlayer.swift
//  VideoPlayerPractice
//
//  Created by littleossa on 2022/08/19.
//

import SwiftUI
import AVKit

struct SpeedAdjustableVideoPlayer: View {
    
    @StateObject var viewModel: SpeedAdjustableVideoPlayerViewModel
    
    init(player: AVPlayer) {
        _viewModel = StateObject(wrappedValue: SpeedAdjustableVideoPlayerViewModel(player: player))
    }
    
    var body: some View {
        
        VStack {
            VideoPlayer(player: viewModel.player)
            
            HStack(spacing: 1) {
                Spacer()
                
                Menu(viewModel.displaySpeedTitle) {
                    ForEach(PlaySpeed.allCases) { speed in
                        Button {
                            viewModel.changeRate(into: speed)
                        } label: {
                            Text(speed.rawValue)
                        }
                    }
                }
            }
        }
        .background(.black)
    }
}
