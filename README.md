# TestKingfisherWebP

A test project demonstrating WebP image support using Kingfisher and KingfisherWebP.

## Overview

This SwiftUI application showcases how to load and display animated WebP images from local bundle resources using Kingfisher's AnimatedImageView with WebP support.

## Features

- Load animated WebP images from bundle
- Display using Kingfisher's AnimatedImageView
- WebP processing and caching support

## Dependencies

- [Kingfisher](https://github.com/onevcat/Kingfisher) - Image downloading and caching library
- [KingfisherWebP](https://github.com/Yeatse/KingfisherWebP) - WebP format support extension for Kingfisher

## Requirements

- iOS 14.0+
- Xcode 13.0+
- Swift 5.0+

## Usage

The project includes a sample WebP image (`heart.webp`) that is loaded using Kingfisher with WebP processor and serializer:

```swift
animatedView.kf.setImage(with: url, options: [
    .processor(WebPProcessor.default),
    .cacheSerializer(WebPSerializer.default)
])
```

## License

This project is released into the public domain under [The Unlicense](LICENSE).