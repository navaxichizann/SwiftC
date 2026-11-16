import SwiftUI

public enum GlossyToggleStyle {
    case slider(shows: Shows)
    case box(shows: Shows)
    
    public enum Shows {
        case off
        case icon(on: String, off: String)
        case text(on: String, off: String)
        case power
    }
}
public enum ToggleGlass {
    case glass
    case nonGlass(tintOption: tintopt)
    
    public enum tintopt {
        case more(light: Color, dark: Color)
        case one(color: Color)
    }
}
public struct GlossyToggle: View {
    @Environment(\.colorScheme) var cs
    @Binding public var variable: Bool
    public var action: () -> Void
    public var cornerRadius: Int
    public var color: Color
    public var glass: ToggleGlass
    public var type: GlossyToggleStyle
    
    public init(bool: Binding<Bool>, action: @escaping () -> Void = {}, cornerRadius: Int = 18, tint: Color = .blue, type: GlossyToggleStyle = .slider(shows: .power), glass: ToggleGlass = .nonGlass(tintOption: .more(light: .white, dark: .black))) {
        self._variable = bool
        self.action = action
        self.cornerRadius = cornerRadius
        self.color = tint
        self.type = type
        self.glass = glass
    }
    
    public var body: some View {
        switch type {
        case .slider :
            ZStack {
                Switch()
                Button {
                    withAnimation(.bouncy(duration: 0.25)) {
                        variable.toggle()
                    }
                    action()
                } label: {
                    Text("Button")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .opacity(0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 80, height: 45)
            .opacity(0.9)
        case .box :
            ZStack {
                Box()
                Button {
                    withAnimation(.bouncy(duration: 0.25)) {
                        variable.toggle()
                    }
                    action()
                } label: {
                    Text("Button")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .opacity(0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 50, height: 50)
            .opacity(0.9)
        }
    }
    
    @ViewBuilder
    public func Switch() -> some View {
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .foregroundStyle(variable ? color : .gray)
            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius)))
            .overlay(
                ZStack {
                    switch glass {
                    case .glass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .frame(width: 38)
                            .foregroundStyle(cs == .light ? .clear : .gray)
                            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius) - 5))
                            .offset(x: variable ? 16 : -16) 
                    case .nonGlass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .frame(width: 38)
                            .foregroundStyle(sctoggle)
                            .offset(x: variable ? 16 : -16) 
                    }
                    switch type {
                    case .slider(let shows) :
                        switch shows {
                        case .off : 
                            Text("Nothing")
                                .hidden()
                        case .power :
                            Text("I")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, variable ? 17 : 14)
                                .foregroundStyle(variable ? .primary : .secondary)
                            Text("O")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, !variable ? 13 : 10)
                                .foregroundStyle(!variable ? .primary : .secondary)
                        case .icon(let on, let off) :
                            Image(systemName: on)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, variable ? 11 : 8)
                                .foregroundStyle(variable ? .primary : .secondary)
                            Image(systemName: off)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, !variable ? 11 : 8)
                                .foregroundStyle(!variable ? .primary : .secondary)
                        case .text(let on, let off) : 
                            Text(on)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, variable ? 9 : 6)
                                .foregroundStyle(variable ? .primary : .secondary)
                            Text(off)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, !variable ? 9 : 6)
                                .foregroundStyle(!variable ? .primary : .secondary)
                        }
                    case .box(let shows) :
                        switch shows {
                        case .off :
                            Text("Nothing")
                                .hidden()
                        case .power :
                            Text(variable ? "O" : "I")
                        case .icon(let on, let off) :
                            Image(systemName: variable ? on : off)
                        case .text(let on, let off) : 
                            Text(variable ? on : off)
                        }
                    }
                }
                    .padding(5)
            )
    }
    public func Box() -> some View {
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .foregroundStyle(variable ? color : .gray)
            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius)))
            .overlay(
                ZStack {
                    switch glass {
                    case .glass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .foregroundStyle(cs == .light ? .clear : .gray)
                            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius) - 5))
                    case .nonGlass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .foregroundStyle(sctoggle)
                    }
                    switch type {
                    case .slider(let shows) :
                        switch shows {
                        case .off : 
                            Text("Nothing")
                                .hidden()
                        case .power :
                            Text("O")
                            Text("I")
                        case .icon(let on, let off) :
                            Image(systemName: on)
                            Image(systemName: off)
                        case .text(let on, let off) : 
                            Text(on)
                            Text(off)
                        }
                    case .box(let shows) :
                        switch shows {
                        case .off :
                            Text("Nothing")
                                .hidden()
                        case .power :
                            Text(variable ? "O" : "I")
                        case .icon(let on, let off) :
                            Image(systemName: variable ? on : off)
                        case .text(let on, let off) : 
                            Text(variable ? on : off)
                        }
                    }
                }
                    .padding(5)
            )
    }
    private var sctoggle: Color {
        switch glass {
        case .glass : 
            return .clear
        case .nonGlass(let tint) :
            switch tint {
            case .one(let color) :
                return color
            case .more(let light, let dark) :
                return cs == .dark ? dark : light
            }
        }
    }
}

