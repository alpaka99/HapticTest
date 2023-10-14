//
//  ContentView.swift
//  HapticTest
//
//  Created by user on 2023/10/14.
//

import SwiftUI

class HapticManager {
    static let sharedInstance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct ContentView: View {
    let hapticManager = HapticManager.sharedInstance
    
    @State private var text = ""
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Button("SUCCESS") { hapticManager.notification(type: .success) }
                Button("WARNING") { hapticManager.notification(type: .warning) }
                Button("ERROR") { hapticManager.notification(type: .error) }
            }
            
            Divider()
             
            Group {
                Button("SOFT") { hapticManager.impact(style: .soft) }
                Button("LIGHT") { hapticManager.impact(style: .light) }
                Button("MEDIUM") { hapticManager.impact(style: .medium) }
                Button("RIGID") { hapticManager.impact(style: .rigid) }
                Button("HEAVY") { hapticManager.impact(style: .heavy) }
            }
            
            TextField("haptic text field", text: $text)
                .onChange(of: text) { _ in
                    hapticManager.impact(style: .medium)
                }
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
