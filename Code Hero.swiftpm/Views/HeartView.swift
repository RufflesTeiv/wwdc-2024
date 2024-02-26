//
//  HeartView.swift
//
//
//  Created by Rafa (Ruffles) on 25/02/24.
//

import Foundation
import SwiftUI

struct HeartView : View {
    @ObservedObject var gameController = GameController.shared
    @ObservedObject var uiController = UiController.shared
    
    let player : Bool
    
    var body: some View {
        HStack (spacing: 8) {
            if (!player) {
                Spacer()
                if (damagedHearts() >= 1) {
                    ForEach(1...damagedHearts(), id: \.self) { _ in
                        Image("heart-empty")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 96, height: 80)
                    }
                }
            }
            if (fullHearts() >= 1 ) {
                ForEach(1...fullHearts(), id: \.self) {_ in
                    Image("heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 96, height: 80)
                }
            }
            if (player) {
                if (damagedHearts() >= 1) {
                    ForEach(1...damagedHearts(), id: \.self) { _ in
                        Image("heart-empty")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 96, height: 80)
                    }
                }
                Spacer()
            }
        }
        .padding(.all, 8)
    }
    
    private func fullHearts() -> Int {
        if player {
            return gameController.playerHealth
        }
        return uiController.enemyHealth
    }
    private func damagedHearts() -> Int {
        if player {
            return gameController.player.maxHealth - gameController.playerHealth
        }
        return uiController.enemyMaxHealth - uiController.enemyHealth
    }
}
