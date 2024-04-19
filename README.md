# 📳 Composable haptics

<p>
    <img src="https://img.shields.io/badge/Swift-5.9-orange.svg" />
    <img src="https://img.shields.io/badge/iOS->= 15.0-red.svg" />
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

`HapticFeedbackClient` is a dependency (see [swift-dependencies](https://github.com/pointfreeco/swift-dependencies)) that allows to generate haptics in a centralized and testable way.

## Usage

The client can be used in reducers to create haptic feedbacks when processing actions.

```swift
@Reducer
struct Feature {
    ...
    @Dependency(\.hapticFeedbackClient)
    var haptics

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didScrollDateWheel:
                haptics.perform(.selection)
                return .none
            }
        }
    }
    ...
}
```

## Installation

You can add the library to an Xcode project by adding it as a package dependency.

> https://github.com/whutao/swift-composable-haptics

If you want to use the library in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to a `dependencies` clause in your `Package.swift`:

``` swift
dependencies: [
    .package(url: "https://github.com/whutao/swift-composable-haptics", from: "1.0.0")
]
```

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
