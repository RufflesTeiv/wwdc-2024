//
//  NinePatchView.swift
//  
//
//  Created by Rafa (Ruffles) on 25/02/24.
//

import Foundation
import SwiftUI

struct NinePatch {
    let borders : [CGFloat]
    let baseImageName : String
    
    init(borders: [CGFloat], baseImageName: String) {
        // Clockwise direction
        self.borders = borders
        // All images must be "baseImageName#"
        // Left to right, up to down
        self.baseImageName = baseImageName
    }
}

struct NinePatchView : View {
    let ninePatch : NinePatch
    
    var body: some View {
        let imageNames = getImageNames(baseImageName: ninePatch.baseImageName)
        let borders = ninePatch.borders
        
        VStack (spacing: 0) {
            HStack (spacing: 0) {
                Image(imageNames[0])
                    .frame(width: borders[3], height: borders[0])
                Image(imageNames[1])
                    .resizable(resizingMode: .tile)
                    .frame(height: borders[0])
                    .frame(maxWidth: .infinity)
                Image(imageNames[2])
                    .frame(width: borders[1], height: borders[0])
            }
            .padding(.all,0)
            HStack (spacing: 0) {
                Image(imageNames[3])
                    .resizable(resizingMode: .tile)
                    .frame(width: borders[3])
                    .frame(maxHeight: .infinity)
                Image(imageNames[4])
                    .resizable(resizingMode: .tile)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Image(imageNames[5])
                    .resizable(resizingMode: .tile)
                    .frame(width: borders[1])
                    .frame(maxHeight: .infinity)
            }
            .padding(.all,0)
            HStack (spacing: 0) {
                Image(imageNames[6])
                    .frame(width: borders[3], height: borders[2])
                Image(imageNames[7])
                    .resizable(resizingMode: .tile)
                    .frame(height: borders[2])
                    .frame(maxWidth: .infinity)
                Image(imageNames[8])
                    .frame(width: borders[1], height: borders[2])
            }
            .padding(.all,0)
        }
        .padding(.all,0)
    }
    
    func getImageNames(baseImageName : String) -> [String] {
        var result : [String] = []
        for i in 0...8 {
            result.append(baseImageName+String(i))
        }
        return result
    }
}
