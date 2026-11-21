import SwiftUI
import SwiftCs

public struct FeatureList: View {
    @State public var bool: [Bool] = [false, false, false]
    
    public var unevroundedrect: UnevenRoundedRectangle {
        UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 20, topTrailingRadius: 0, style: .continuous)
    }
    
    public init() {}
    
    public var body: some View {
        VStack{
            Text("Feature List")
                .font(.system(size: 25, weight: .bold))
            ZStack(alignment: .topLeading) {
                ScrollView {
                    LazyVStack {
                        Text("Color")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Color()
                        Text("GlossyElements")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        GlossyButtonShow()
                        GlossyToggleShow()
                        VStack(spacing: 2){
                            Text("Made by Navaxichizann on Github")
                                .font(.system(size: 15, weight: .light, design: .rounded))
                            Text("This project uses Unlicense License")
                                .font(.system(size: 10, weight: .light, design: .rounded))
                        }
                    }
                    .padding(10)
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                .clipShape(.rect(cornerRadius: 20))
                .padding(5)
                .shadow(radius: 5)
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(width: 85, height: 35)
                        .clipShape(unevroundedrect)
                        .padding(5)
                        .opacity(0.5)
                    Text("Ver: 1.1.7")
                        .padding(8)
                }
            }
        }
    }
    
    @ViewBuilder
    public func GlossyButtonShow() -> some View {
        LazyVStack{
            Text("GlossyButton")
            GlossyButton(
                action: {
                    withAnimation(.spring(duration: 0.2)) {
                        bool[0].toggle()
                    }
                },
                label: {
                    Text(bool[0] ? "GlossyButton!" : "Button")
                        .bold()
                }
            )
        }
    }
    public func GlossyToggleShow() -> some View {
        LazyVStack{
            Text(bool[1] ? "GlossyToggle: isOn" : "GlossyToggle: Slider")
            GlossyToggle($bool[1])
            Text(bool[2] ? "GlossyToggle: isOn" : "GlossyToggle: Box")
            GlossyToggle($bool[2], type: .box(.power))
        }
    }
    public func Color() -> some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                Rectangle()
                    .foregroundStyle(.coral)
                    .frame(height: 90)
                    .overlay(Text("Coral") .opacity(0.5))
                Rectangle()
                    .foregroundStyle(.lemon)
                    .overlay(Text("Lemon") .opacity(0.5) .foregroundStyle(.black))
                Rectangle()
                    .foregroundStyle(.lime)
                    .overlay(Text("Lime") .opacity(0.5) .foregroundStyle(.black))
            }
            HStack(spacing: 5) {
                Rectangle()
                    .foregroundStyle(.matcha)
                    .frame(height: 90)
                    .overlay(Text("Matcha") .opacity(0.5))
                Rectangle()
                    .foregroundStyle(.tan)
                    .overlay(Text("Tan") .opacity(0.5))
                Rectangle()
                    .foregroundStyle(.cream)
                    .overlay(Text("Cream") .opacity(0.5) .foregroundStyle(.black))
            }
            HStack(spacing: 5) {
                Rectangle()
                    .foregroundStyle(.pig)
                    .frame(height: 90)
                    .overlay(Text("Pig") .opacity(0.5))
                Rectangle()
                    .foregroundStyle(.magenta)
                    .overlay(Text("Magenta") .opacity(0.5))
                Rectangle()
                    .foregroundStyle(.concrete)
                    .overlay(Text("Concrete") .opacity(0.5) .foregroundStyle(.black))
            }
            HStack(spacing: 5) {
                Rectangle()
                    .foregroundStyle(.lightGray)
                    .frame(height: 90)
                    .overlay(Text("LightGray") .opacity(0.5) .foregroundStyle(.black))
                Rectangle()
                    .foregroundStyle(.darkGray)
                    .overlay(Text("DarkGray") .opacity(0.5) .foregroundStyle(.white))
                Rectangle()
                    .foregroundStyle(.charcoal)
                    .overlay(Text("Charcoal") .opacity(0.5) .foregroundStyle(.white))
            }
        }
    }
}
