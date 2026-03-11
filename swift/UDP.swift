//
//  UDP.swift
//  UDP
//
//  Created by Manuel Guzman on 10/03/26.
//

import Foundation
import Network

final class UDPSender {
    private let connection: NWConnection

    init(host: String, port: UInt16) {
        let nwHost = NWEndpoint.Host(host)
        let nwPort = NWEndpoint.Port(rawValue: port)!

        connection = NWConnection(host: nwHost, port: nwPort, using: .udp)
        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("UDP ready")
            case .failed(let error):
                print("UDP failed: \(error)")
            default:
                break
            }
        }
        connection.start(queue: .global())
    }

    func send(point: CGPoint, pressed: Bool) {
        let message = "x=\(Int(point.x)),y=\(Int(point.y)),pressed=\(pressed)"
        let data = Data(message.utf8)

        connection.send(content: data, completion: .contentProcessed { error in
            if let error {
                print("Send error: \(error)")
            }
        })
    }
}
