# How to use: GlossyToggle
/GlossyButton Ver 1.0.03/

GlossyButton is highly customizable, modern button component for SwiftUI supporting glassmorphism effects, flexible styling like normal button and Gesture state.

**Features (Summarized)**

• Glass Effects: Supports normal glassmorphic layers, frosted backgrounds (.ultraThinMaterial), or solid/adaptive color styles.

• State Aware: Built-in support for disabled states (desaturation, brightness, and opacity adjustments) and interactive press animations.

• Adaptive Styling: Easily switch between single colors or light/dark mode variants for both the button body and the label.

**Example** 

*Must add the package first using this link (https://github.com/navaxichizann/SwiftCs.git)*

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Standard button without customization
            GlossyButton(
                label: {
                    Label("Click Me", systemImage: "sparkles")
                },
            )
            
            // Button with custom solid/adaptive background colors
            GlossyButton(
                radius: 16,
                action: {
                    print("button tapped!")
                },
                label: {
                    Text("Custom Style")
                        .fontWeight(.bold)
                },
                glass: .nonGlass(.more(light: .white, dark: .gray)),
                clabel: .one(.white),
                padding: 8
            )
            .tint(.brown)
            .disabled(false)
        }
        .padding()
    }
}
```

## Features
