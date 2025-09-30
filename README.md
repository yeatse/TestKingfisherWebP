# TestKingfisherWebP

A test project demonstrating WebP image support using Kingfisher and KingfisherWebP.

## Overview

This SwiftUI application showcases how to load and display animated WebP images from both local bundle resources and network URLs using Kingfisher's AnimatedImageView with WebP support.

## Features

- Load animated WebP images from local bundle
- Load animated WebP images from network URLs
- Display using Kingfisher's AnimatedImageView
- WebP processing and caching support
- Custom HTTP headers for network requests

## Dependencies

- [Kingfisher](https://github.com/onevcat/Kingfisher) - Image downloading and caching library
- [KingfisherWebP](https://github.com/Yeatse/KingfisherWebP) - WebP format support extension for Kingfisher

## Requirements

- iOS 14.0+
- Xcode 13.0+
- Swift 5.0+

## Usage

### Local Bundle WebP

The project includes a sample WebP image (`heart.webp`) that is loaded from the bundle:

```swift
if let url = Bundle.main.url(forResource: "heart", withExtension: "webp") {
    animatedView.kf.setImage(with: url, options: [
        .processor(WebPProcessor.default),
        .cacheSerializer(WebPSerializer.default)
    ])
}
```

### Network WebP

The app also demonstrates loading animated WebP images from network URLs with custom headers:

```swift
if let url = URL(string: "https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp") {
    let modifier = AnyModifier { request in
        var req = request
        req.addValue("image/webp, */*", forHTTPHeaderField: "Accept")
        return req
    }

    animatedView.kf.setImage(with: url, options: [
        .processor(WebPProcessor.default),
        .cacheSerializer(WebPSerializer.default),
        .requestModifier(modifier),
        .transition(.fade(0.25))
    ])
}
```

## License

This project is released into the public domain under [The Unlicense](LICENSE).