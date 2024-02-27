//
//  LevelView.swift
//
//
//  Created by Rafa (Ruffles) on 23/02/24.
//

import Foundation
import SwiftUI
import SpriteKit

struct LevelView : View {
    @ObservedObject var gameController = GameController.shared
    @ObservedObject var uiController = UiController.shared
    
    var body: some View {
        
        // Width x Height : 1024 x 1366
        var scene: SKScene {
            let scene = CombatScene()
            // Tamanho pixel art : 128 x 57 (8 tiles x 4 tiles)
            scene.size = CGSize(width: 1024, height: 450)
            return scene
        }
        
        ZStack {
            // Background
            Rectangle()
                .fill(Color("black-red"))
                .ignoresSafeArea()
            
            // Main
            VStack {
                // Cena de jogo
                SpriteView(scene: scene)
                    .frame(width: 1024, height: 450)
                    .ignoresSafeArea()
                
                // Pergunta e código
                ZStack (alignment: .top) {
                    Text(uiController.currentQuestion.name)
                        .foregroundStyle(Color("black-red"))
                        .font(.custom("RuneScape-UF", size: 75))
                        .frame(maxHeight: .infinity)
                        .padding(.all,48)
                        .background {
                            NinePatchView(ninePatch: PatchData.mainPatch)
                        }
                        .frame(height: 255)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.5)
                    
                    let codeText = uiController.currentQuestion.code
                    if (codeText != "") {
                        VStack {
                            Spacer()
                                .frame(height: 212)
                            Text(codeText)
                                .foregroundStyle(Color("white"))
                                .font(.custom("Kenney-Pixel", size: 128))
                                .frame(maxHeight: .infinity)
                                .padding(.all,48)
                                .background {
                                    NinePatchView(ninePatch: PatchData.codePatch)
                                }
                                .frame(width: 790, height: 200)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    if (uiController.tipsAllowed) {
                        VStack (spacing: 0) {
                            Spacer().frame(height: 185)
                            HStack {
                                Spacer().frame(width: 893)
                                Image("question-mark")
                                    .onTapGesture {
                                        uiController.showPrompt(text: uiController.currentQuestion.tip)
                                    }
                            }
                        }
                        .padding(.all,0)
                    }
                }
                .padding(.all,8)
                
                // Opções
                Group {
                    let question = uiController.currentQuestion
                    let layout = question.layout
                    
                    if (layout == .list) {
                        VStack (spacing: 16) {
                            ForEach(0..<question.options.count, id: \.self) { i in
                                let option = question.options[i]
                                Text(option.text)
                                    .foregroundStyle(Color("black-red"))
                                    .font(.custom("RuneScape-UF", size: 60))
                                    .frame(maxHeight: .infinity)
                                    .padding(.all,32)
                                    .background {
                                        NinePatchView(ninePatch: PatchData.buttonPatch)
//                                            .colorMultiply(<#T##Color#>)
                                    }
                                    .frame(width: 910, height: 145)
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.5)
                                    .onTapGesture {
                                        uiController.questionAnswered(index: i)
                                    }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            // Corações
            VStack {
                HeartView(player: false)
                Spacer()
                    .frame(height: 330)
                HeartView(player: true)
                Spacer()
            }
            .ignoresSafeArea()
            
            // Prompt
            PromptView()
        }
    }
}
