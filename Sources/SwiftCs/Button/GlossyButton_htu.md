# How to use: GlossyButton
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
import SwiftCs

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Basic glossy button with default settings
            GlossyButton(
                label: {
                    Label("Click Me", systemImage: "sparkles")
                },
            )
            
            // Customized button with action
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

*You don’t have to add everything in the full customization code for it work. You only need to put it in order.*

You can use this feature by adding ```GlossyButton(action: {Action}, label: {Labels}``` in to your code or full customization code > 
```
```

**Inside GlossyToggle**

*Please put these in order*

1. $Bool is a input for Binding Boolean

2. action: is for inputting the action it’ll do.

3. radius: is for putting the radius of the Corners

4. type: include 2 type as .slider for basic normal toggle, and .box is for checkboxes. Inside .slider and .box is (shows: which         have 4 type as .off for no icons, .power for basic normal switch icon, .icon for specific icon and .text for texts. inside it is     icon which have .one and .both for slider only, on and off for icons and texts. 

5. glass: include 2 type is .glass and .nonGlass for .glass contains 2 types is .normal and .frosted, .normal will use normal glassEffect while .frosted will use background(.ultraThinMaterial), for .nonGlass also contains 2 types is .one and .more for .one you must put the Color, while .more contain light and dark color of the version.

**Outside GlossyToggle**

1. .tint is for changing the color of the Toggle, if not added it will use the accent color, if the accent color is not set it will use system blue or .blue

2. .disabled is for disabling the toggle and make the toggle color change.
