//
//  LevelsData.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

final class LevelsData {
    static let levels: [Level] = [
        Level(
            name: "Tutorial",
            enemies: [],
            finalEnemy: EnemiesData.getEnemyByIdentifier(identifier: "namecrate")!,
            enemyCount: 1,
            initialPrompt: "Let me tell you how I work: you answer questions correctly, and that gives me power to **attack**. You can always get some tips from me to help you answering the questions.\n\nLet’s try that out on that **namecrate** over there.",
            finalPrompt: "")
    ]
}
