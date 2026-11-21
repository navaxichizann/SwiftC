import SwiftUI

public extension Color {
    static let lemon = Color(red: 250 / 255, green: 239 / 255, blue: 74 / 255)
    static let lime = Color(red: 157 / 255, green: 243 / 255, blue: 44 / 255)
    static let matcha = Color(red: 116 / 255, green: 161 / 255, blue: 46 / 255)
    static let coral = Color(red: 255 / 255, green: 111 / 255, blue: 97 / 255)
    static let magenta = Color(red: 230 / 255, green: 13 / 255, blue: 204 / 255)
    static let pig = Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
    static let cream = Color(red: 235 / 255, green: 212 / 255, blue: 192 / 255)
    static let tan = Color(red: 133 / 255, green: 81 / 255, blue: 52 / 255)
}

public extension ShapeStyle where Self == Color {
    static var lemon: Color { .lemon }
    static var lime: Color { .lime }
    static var matcha: Color { .matcha }
    static var coral: Color { .coral }
    static var magenta: Color { .magenta }
    static var pig: Color { .pig }
    static var cream: Color { .cream }
    static var tan: Color { .tan }
}
