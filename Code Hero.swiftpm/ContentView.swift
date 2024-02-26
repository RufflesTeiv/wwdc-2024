import SwiftUI
import SpriteKit

struct ContentView: View {
    @ObservedObject var gameController = GameController.shared
    
    var body: some View {
        LevelView()
            .statusBarHidden(true)
    }
}
