import SwiftUI

public enum GlossyToggleStyle {
    case slider(shows: Shows)
    case box(shows: ShowsOne)
    
    public enum Shows {
        case off
        case icon(_ icon: AlwsOn, on: String, off: String)
        case text(_ icon: AlwsOn, on: String, off: String)
        case power(_ icon: AlwsOn)
        
        public enum AlwsOn {
            case one
            case both
        }
    }
    public enum ShowsOne {
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
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.colorScheme) var cs
    @Binding public var variable: Bool
    public var action: () -> Void
    public var cornerRadius: Int
    public var glass: ToggleGlass
    public var type: GlossyToggleStyle
    
    public init(_ bool: Binding<Bool>, action: @escaping () -> Void = {}, cornerRadius: Int = 18, type: GlossyToggleStyle = .slider(shows: .power(.one)), glass: ToggleGlass = .nonGlass(tintOption: .more(light: .white, dark: .black))) {
        self._variable = bool
        self.action = action
        self.cornerRadius = cornerRadius
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
            .foregroundStyle(variable ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius)))
            .saturation(isEnabled ? 1.0 : 0.6)
            .brightness(isEnabled ? 0.0 : -0.25)
            .opacity(isEnabled ? 1.0 : 0.75)
            .overlay(
                ZStack {
                    switch glass {
                    case .glass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 4)
                            .frame(width: 38, height: 38)
                            .foregroundStyle(cs == .light ? .clear : .gray)
                            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius) - 4))
                            .offset(x: variable ? 17 : -17) 
                            .saturation(isEnabled ? 1.0 : 0.5)
                            .brightness(isEnabled ? 0.0 : -0.2)
                    case .nonGlass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 4)
                            .frame(width: 38, height: 38)
                            .foregroundStyle(sctoggle)
                            .offset(x: variable ? 17 : -17) 
                            .saturation(isEnabled ? 1.0 : 0.5)
                            .brightness(isEnabled ? 0.0 : -0.2)
                    }
                    typeshow()
                }
                    .padding(5)
            )
    }
    public func Box() -> some View {
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .foregroundStyle(variable ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius)))
            .saturation(isEnabled ? 1.0 : 0.6)
            .brightness(isEnabled ? 0.0 : -0.25)
            .opacity(isEnabled ? 1.0 : 0.75)
            .overlay(
                ZStack {
                    switch glass {
                    case .glass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .foregroundStyle(cs == .light ? .clear : .gray)
                            .glassEffect(in: .rect(cornerRadius: CGFloat(cornerRadius) - 5))
                            .saturation(isEnabled ? 1.0 : 0.5)
                            .brightness(isEnabled ? 0.0 : -0.2)
                    case .nonGlass :
                        RoundedRectangle(cornerRadius: CGFloat(cornerRadius) - 5)
                            .foregroundStyle(sctoggle)
                            .saturation(isEnabled ? 1.0 : 0.5)
                            .brightness(isEnabled ? 0.0 : -0.2)
                    }
                    typeshow()
                }
                    .padding(5)
            )
    }
    public func typeshow() -> some View {
        ZStack {
            switch type {
            case .slider(let shows) :
                switch shows {
                case .off : 
                    Text("Nothing")
                        .hidden()
                case .power(let icon) :
                    switch icon {
                    case .both :
                        typeshow_power(false)
                    case .one :
                        typeshow_power(true)
                    }
                    
                case .icon(let icon, let on, let off) :
                    switch icon {
                    case .both :
                        typeshow_icon(false, on: on, off: off)
                    case .one :
                        typeshow_icon(true, on: on, off: off)
                    }
                case .text(let icon, let on, let off) : 
                    switch icon {
                    case .both :
                        typeshow_text(false, on: on, off: off)
                    case .one :
                        typeshow_text(true, on: on, off: off)
                    }
                }
            case .box(let shows) :
                switch shows {
                case .off :
                    Text("Nothing")
                        .hidden()
                case .power :
                    Text(!variable ? "O" : "I")
                        .foregroundStyle(sctoggleS)
                case .icon(let on, let off) :
                    Image(systemName: variable ? on : off)
                        .foregroundStyle(sctoggleS)
                case .text(let on, let off) : 
                    Text(variable ? on : off)
                        .foregroundStyle(sctoggleS)
                }
            }
        }
    }
    public func typeshow_power(_ shows: Bool) -> some View {
        ZStack{
            if !shows {
                Text("I")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, variable ? 16 : 13)
                    .foregroundStyle(variable || !isEnabled ? sctoggleS : .secondary)
                Text("O")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, !variable ? 12 : 9)
                    .foregroundStyle(!variable || !isEnabled ? sctoggleS : .secondary)
            } else {
                Text(variable ? "I" : "O")
                    .padding(variable ? 14 : 10)
                    .frame(maxWidth: .infinity, alignment: variable ? .leading : .trailing)
                    .foregroundStyle(sctoggle == .clear ? .white : sctoggle)
            }
        }
    }
    public func typeshow_icon(_ shows: Bool, on: String, off: String) -> some View {
        ZStack {
            if !shows {
                Image(systemName: on)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, variable ? 11 : 8)
                    .foregroundStyle(variable || !isEnabled ? sctoggleS : .secondary)
                Image(systemName: off)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, !variable ? 11 : 8)
                    .foregroundStyle(!variable || !isEnabled ? sctoggleS : .secondary)
            } else {
                Image(systemName: variable ? on : off)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: variable ? .leading : .trailing)
                    .foregroundStyle(sctoggle == .clear ? .white : sctoggle)
            }
        }
    }
    public func typeshow_text(_ shows: Bool, on: String, off: String) -> some View {
        ZStack {
            if !shows {
                Text(on)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, variable ? 9 : 6)
                    .foregroundStyle(variable || !isEnabled ? sctoggleS : .secondary)
                Text(off)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, !variable ? 9 : 6)
                    .foregroundStyle(!variable || !isEnabled ? sctoggleS : .secondary)
            } else {
                Text(variable ? on : off)
                    .padding(6)
                    .frame(maxWidth: .infinity, alignment: variable ? .leading : .trailing)
                    .foregroundStyle(sctoggle == .clear ? .white : sctoggle)
            }
        }
    }
    public var sctoggle: Color {
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
    public var sctoggleS: Color {
        switch glass {
        case .glass : 
            return .black
        case .nonGlass(let tint) :
            switch tint {
            case .one(let color) :
                return color == .white ? .black : color == .black ? .white : cs == .light ? .white : .black
            case .more(let light, let dark) :
                return cs == .dark ? light : dark
            }
        }
    }
}

