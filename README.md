# ShadowPixel

[![Version](https://img.shields.io/cocoapods/v/ShadowPixel.svg?style=flat)](https://cocoapods.org/pods/ShadowPixel)
[![License](https://img.shields.io/cocoapods/l/ShadowPixel.svg?style=flat)](https://cocoapods.org/pods/ShadowPixel)
[![Platform](https://img.shields.io/cocoapods/p/ShadowPixel.svg?style=flat)](https://cocoapods.org/pods/ShadowPixel)

ShadowPixel is a service to monitor the health of your analytics implementation.
It does this by hooking into Firebase Analytics, and monitoring logged events.

The ShadowPixel service will check for irregularities in the logged information.

## Installation

### Swift Package Manager

Follow [this doc](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

### CocoaPods

ShadowPixel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ShadowPixel', :git => 'https://github.com/BakkerTom/ShadowPixel'
```

## Usage

To start montitoring analytic events, add the following code to your project:

```swift
let baseUrl = URL(string: "https://YOUR_SHADOW_PIXEL_ENVIRONMENT.app.run")!
let options = ShadowPixelOptions(baseUrl: baseUrl, domain: "eftapp")
ShadowPixel.configure(options: options)
```

## Author

Tom Bakker <tom.bakker92@gmail.com>

## License

ShadowPixel is available under the MIT license. See the LICENSE file for more info.
