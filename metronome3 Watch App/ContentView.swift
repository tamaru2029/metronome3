//
//  ContentView.swift
//  metronome3 Watch App
//
//  Created by hironori on 2024/07/28.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var isVibrating = false
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(isVibrating ? "振動中" : "停止中")
            Button(action: {
                isVibrating.toggle()
            }) {
                Text(isVibrating ? "停止" : "開始")
            }
        }
        .onReceive(timer) { _ in
            if isVibrating {
                WKInterfaceDevice.current().play(.click)
            }
        }
    }
}

#Preview {
    ContentView()
}
