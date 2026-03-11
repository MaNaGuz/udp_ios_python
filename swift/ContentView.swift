//
//  ContentView.swift
//  UDP
//
//  Created by Manuel Guzman on 09/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var mousePosition: CGPoint = .zero
    @State private var isPressed: Bool = false
    
    private let udpSender = UDPSender(host: "127.0.0.1", port: 5001)
    
    var body: some View {
        VStack {
            Text("Mouse: \(Int(mousePosition.x)), \(Int(mousePosition.y))")
            
            MouseTrackingView(
                onMouseDown: { point in
                    mousePosition = point
                    isPressed = true
                    udpSender.send(point: point, pressed: true)
                },
                onMouseDragged: { point in
                    mousePosition = point
                    udpSender.send(point: point, pressed: true)
                },
                onMouseUp: { point in
                    mousePosition = point
                    isPressed = false
                    udpSender.send(point: point, pressed: false)
                }
            )
            .frame(width: 400, height: 300)
            .background(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(style: StrokeStyle(lineWidth: 2))
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
