import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid"), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid"), dismissButton: .default(Text("OK")))
    static let networkError = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid"), dismissButton: .default(Text("OK")))
    static let invalidJson = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid"), dismissButton: .default(Text("OK")))
}
