//
//  PromptView.swift
//
//
//  Created by Rafa (Ruffles) on 26/02/24.
//

import Foundation
import SwiftUI

struct PromptView : View {
    @ObservedObject var uiController = UiController.shared
    
    var body: some View {
        Group {
            if (uiController.promptShown) {
                ZStack {
                    Text(uiController.promptText)
                        .foregroundStyle(Color("black-red"))
                        .font(.custom("RuneScape-UF", size: 75))
                        .padding(.all,48)
                        .background {
                            NinePatchView(ninePatch: PatchData.paperPatch)
                        }
                        .padding(.all,96)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.25))
                .onTapGesture {
                    uiController.hidePrompt()
                }
            }
        }
    }
}
