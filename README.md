# MetalUI
Metal with SwiftUI 🤘

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/MetalUI", exact: .init(0, 1, 4))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
import MetalUI
import SwiftUI

struct ContentView: View {
    var body: some View {
        MetalView {
            CustomMetalView() // custom implementation
        }
    }
    .ignoresSafeArea()
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/MetalUI/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
