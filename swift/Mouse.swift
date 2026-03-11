//
//  Mouse.swift
//  UDP
//
//  Created by Manuel Guzman on 10/03/26.
//

import SwiftUI
import AppKit

final class TrackingNSView: NSView {
    var onMouseDown: ((CGPoint) -> Void)?
    var onMouseDragged: ((CGPoint) -> Void)?
    var onMouseUp: ((CGPoint) -> Void)?

    private var lastPointInside: CGPoint = .zero

    override var acceptsFirstResponder: Bool { true }

    private func localLocation(from event: NSEvent) -> CGPoint {
        convert(event.locationInWindow, from: nil)
    }

    private func isInside(_ point: CGPoint) -> Bool {
        bounds.contains(point)
    }

    override func mouseDown(with event: NSEvent) {
        let point = localLocation(from: event)

        if isInside(point) {
            lastPointInside = point
            onMouseDown?(point)
        }
    }

    override func mouseDragged(with event: NSEvent) {
        let point = localLocation(from: event)

        if isInside(point) {
            lastPointInside = point
            onMouseDragged?(point)
        } else {
            onMouseDragged?(lastPointInside)
        }
    }

    override func mouseUp(with event: NSEvent) {
        let point = localLocation(from: event)

        if isInside(point) {
            lastPointInside = point
            onMouseUp?(point)
        } else {
            onMouseUp?(lastPointInside)
        }
    }
}

struct MouseTrackingView: NSViewRepresentable {
    let onMouseDown: (CGPoint) -> Void
    let onMouseDragged: (CGPoint) -> Void
    let onMouseUp: (CGPoint) -> Void

    func makeNSView(context: Context) -> TrackingNSView {
        let view = TrackingNSView()
        view.onMouseDown = onMouseDown
        view.onMouseDragged = onMouseDragged
        view.onMouseUp = onMouseUp
        return view
    }

    func updateNSView(_ nsView: TrackingNSView, context: Context) {
        nsView.onMouseDown = onMouseDown
        nsView.onMouseDragged = onMouseDragged
        nsView.onMouseUp = onMouseUp
    }
}
