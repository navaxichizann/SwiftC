***How to use: GlossyToggle** /Glossy Toggle Ver 1.2/*

GlossyToggle is a highly customizable, modern toggle component for SwiftUI supporting glassmorphism effects, flexible styling styles, icons, text labels, and power states.
Features

**Features (Summarized)**

• Multiple Styles: Choose between .slider and .box toggle layouts.

• Glassmorphism Support: Easily toggle between frosted glass aesthetics and custom tinted non-glass backgrounds.

• Flexible Indicators: Configure internal icons, text labels, power symbols (I/O), or keep it clean with .off.

• State Aware: Fully respects SwiftUI's @Environment(\.isEnabled) and color schemes (light/dark).

**Example** *Must add the package first using this link (https://github.com/navaxichizann/SwiftCs.git)*

```
import SwiftUI
import SwiftCs

struct ContentView: View {
    @State private var isOn = false

    var body: some View {
        VStack(spacing: 20) {
            // Basic slider toggle with default settings
            GlossyToggle($isOn)

            // Customized toggle with an action callback
            GlossyToggle(
                $isOn,
                action: {
                    print("Toggle changed to: \(isOn)")
                },
                radius: 16,
                type: .slider(shows: .power(.one)),
                glass: .nonGlass(tintOption: .more(light: .white, dark: .black))
            )
            .tint(.green)
        }
        .padding()
    }
}
```

**Features**

You can use this by adding ```GlossyToggle($Bool)``` in to your code or full customization code > 
```
GlossyToggle(
        $Bool, 
        action: {Action},     
        radius: Int, 
        type: type(shows: shows(icon, on: String, off: String)), 
        glass: glass(color(light: Color, dark: Color)))
```


