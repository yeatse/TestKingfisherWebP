//
//  ContentView.swift
//  TestKingfisherWebP
//
//  Created by yeatse on 2025/9/30.
//

import SwiftUI
import Kingfisher
import KingfisherWebP

struct ContentView: View {
    var body: some View {
        VStack {
            WebPImageView()
                .frame(width: 200, height: 200)
        }
    }
}

struct WebPImageView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        let animatedView = AnimatedImageView()
        animatedView.contentMode = .scaleAspectFit
        animatedView.backgroundColor = .lightGray

        // 本地 bundle 文件 URL
        if let url = Bundle.main.url(forResource: "heart", withExtension: "webp") {
            animatedView.kf.setImage(with: url, options: [
                .processor(WebPProcessor.default),
                .cacheSerializer(WebPSerializer.default)
            ])
        }

        return animatedView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

#Preview {
    ContentView()
}
