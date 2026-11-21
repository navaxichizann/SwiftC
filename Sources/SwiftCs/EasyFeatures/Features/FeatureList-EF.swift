import SwiftUI
import SwiftCs

public struct FeatureList: View {
    @State public var bool: [Bool] = [false, false, false]

    public init() {}
    
    public var body: some View {
        VStack{
            Text("Feature List")
                .font(.system(size: 25, weight: .bold))
            ScrollView {
                LazyVStack {
                    Text("GlossyElements")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    GlossyButtonShow()
                    GlossyToggleShow()
                    Text("Made by Navaxichizann on Github")
                }
                .padding(10)
            }
            .frame(maxWidth: 300, maxHeight: 300)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
            .padding(5)
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
}
