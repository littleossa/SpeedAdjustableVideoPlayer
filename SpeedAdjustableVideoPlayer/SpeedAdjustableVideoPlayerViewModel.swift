//
//  SpeedAdjustableVideoPlayerModel.swift
//  SpeedAdjustableVideoPlayer
//
//  Created by littleossa on 2022/08/19.
//

import AVKit
import Combine

class SpeedAdjustableVideoPlayerViewModel: ObservableObject {
    
    @Published var player: AVPlayer
    @Published var playSpeed = PlaySpeed.x1
    @Published var displaySpeedTitle = PlaySpeed.x1.displayTitle
    private var lastPlaySpeed = PlaySpeed.x1
    
    private var cancellable: AnyCancellable?
    
    init(player: AVPlayer) {
        self.player = player
        observeRate()
    }
    
    func observeRate() {
        cancellable = player.publisher(for: \.rate).sink(receiveValue: { [weak self] rate in
            guard let self = self else { return }
            if rate == 1.0,
               self.lastPlaySpeed != self.playSpeed {
                // 停止ボタンを押して、再生を押すと自動的にrateが1.0に戻ってしまい
                // playSpeedもx1に戻ってしまう為、
                // 最後に設定していたSpeedにrateを変更する
                self.changeRate(into: self.lastPlaySpeed)
            }
        })
    }
    
    func changeRate(into speed: PlaySpeed) {
        player.rate = speed.rate
        lastPlaySpeed = speed
        displaySpeedTitle = speed.displayTitle
    }
}
