import SwiftUI

public enum glass {
    case glass(_ glasstype: glasstype)
    case nonGlass(_ colors: color)
    
    public enum color {
        case one(_ color: Color)
        case more(light: Color, dark: Color)
    }
    public enum glasstype {
        case normal
        case frosted
    }
}
public enum label {
    case tint
    case one(_ color: Color)
    case more(light: Color, dark: Color)
}

public struct GlossyButton<Label: View>: View {
    @GestureState private var isPressed = false
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.colorScheme) var cs
    public var action: () -> Void
    public var radius: CGFloat
    public var label: Label
    public var glass: glass
    public var padding: CGFloat
    public var clabel: label
    
    public init(
        radius: CGFloat = 20,
        action: @escaping () -> Void = {},
        @ViewBuilder label: () -> Label,
        glass: glass = .nonGlass(.one(.white)),
        clabel: label = .tint,
        padding: CGFloat = 5
    ) {
        self.radius = radius
        self.action = action
        self.label = label()
        self.glass = glass
        self.padding = padding
        self.clabel = clabel
    }
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CGFloat(radius))
                .glassEffect(in: .rect(cornerRadius: CGFloat(radius)))
                .foregroundStyle(.tint)
                .frame(width: 100, height: 50)
                .saturation(isEnabled ? 1.0 : 0.6)
                .brightness(isEnabled ? 0.0 : -0.25)
                .opacity(isEnabled ? 1.0 : 0.75)
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .overlay(
                    ZStack {
                        switch glass {
                        case .glass(let type) :
                            switch type {
                            case .normal :
                                RoundedRectangle(cornerRadius: CGFloat(radius) - 5)
                                    .glassEffect(in: .rect(cornerRadius: CGFloat(radius) - 5))
                                    .foregroundStyle(cs == .light ? .clear : .gray)
                                    .frame(width: 100 - padding * 2, height: 50 - padding * 2)
                                    .scaleEffect(isPressed ? 0.95 : 1.0)
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .updating($isPressed) { _, state, _ in
                                                state = true
                                            }
                                    )
                            case .frosted :
                                RoundedRectangle(cornerRadius: CGFloat(radius) - 5)
                                    .background(.ultraThinMaterial, in: .rect(cornerRadius: CGFloat(radius) - 5))
                                    .foregroundStyle(.clear)
                                    .frame(width: 100 - padding * 2, height: 50 - padding * 2)
                                    .scaleEffect(isPressed ? 0.95 : 1.0)
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .updating($isPressed) { _, state, _ in
                                                state = true
                                            }
                                    )
                            }
                        case .nonGlass(let colors) :
                            switch colors {
                            case .one(let color) :
                                RoundedRectangle(cornerRadius: CGFloat(radius) - 5)
                                    .foregroundStyle(color)
                                    .frame(width: 100 - padding * 2, height: 50 - padding * 2)
                                    .saturation(isEnabled ? 1.0 : 0.6)
                                    .brightness(isEnabled ? 0.0 : -0.25)
                                    .opacity(isEnabled ? 1.0 : 0.75)
                                    .scaleEffect(isPressed ? 0.95 : 1.0)
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .updating($isPressed) { _, state, _ in
                                                state = true
                                            }
                                    )
                            case .more(let light, let dark) : 
                                RoundedRectangle(cornerRadius: CGFloat(radius) - 5)
                                    .foregroundStyle(cs == .light ? light : dark)
                                    .frame(width: 100 - padding * 2, height: 50 - padding * 2)
                                    .saturation(isEnabled ? 1.0 : 0.6)
                                    .brightness(isEnabled ? 0.0 : -0.25)
                                    .opacity(isEnabled ? 1.0 : 0.75)
                                    .scaleEffect(isPressed ? 0.95 : 1.0)
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .updating($isPressed) { _, state, _ in
                                                state = true
                                            }
                                    )
                            }
                        }
                        Button (action: {
                            action()
                        }, label: {
                            Text("Nothing")
                                .opacity(0)
                        })
                        sLabel()
                            .saturation(isEnabled ? 1.0 : 0.6)
                            .brightness(isEnabled ? 0.0 : -0.25)
                            .opacity(isEnabled ? 1.0 : 0.75)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .updating($isPressed) { _, state, _ in
                                        state = true
                                    }
                            )
                    }
                )
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .updating($isPressed) { _, state, _ in
                            state = true
                        }
                )
        }
    }
    @ViewBuilder
    public func sLabel () -> some View {
        switch clabel{
        case .tint :
            label
                .foregroundStyle(.tint)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        case .one(let color) :
            label
                .foregroundStyle(color)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        case .more(let light, let dark) :
            label
                .foregroundStyle(cs == .light ? light : dark)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
    }
}

