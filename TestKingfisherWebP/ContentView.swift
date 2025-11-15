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
        ScrollView {
            Text("本地 Bundle WebP")
                .font(.headline)
            WebPImageView()
                .frame(width: 200, height: 200)
            
            Text("网络 WebP 动图")
                .font(.headline)
            NetworkWebPImageView()
                .frame(width: 200, height: 200)
            
            Text("SwiftUI 网络图片")
                .font(.headline)
            KFAnimatedImage(URL(string: "https://raw.githubusercontent.com/resetsix/draft/main/demo.webp"))
                .setProcessor(WebPProcessor.default)
                .serialize(by: WebPSerializer.default)
                .frame(width: 200, height: 200)
            
            Text("SwiftUI 本地动图")
                .font(.headline)
            KFAnimatedImage(Bundle.main.url(forResource: "heart", withExtension: "webp"))
                .setProcessor(WebPProcessor.default)
                .serialize(by: WebPSerializer.default)
                .frame(width: 200, height: 200)
        }
    }
}

struct WebPImageView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        let animatedView = AnimatedImageView()
        animatedView.contentMode = .scaleAspectFit
        animatedView.backgroundColor = .lightGray
        
        // 设置内容拥抱优先级和抗压缩优先级，让视图遵循外部约束
        animatedView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        animatedView.setContentHuggingPriority(.defaultLow, for: .vertical)
        animatedView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        animatedView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

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

struct NetworkWebPImageView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        let animatedView = AnimatedImageView()
        animatedView.contentMode = .scaleAspectFit
        animatedView.backgroundColor = .lightGray
        
        // 设置内容拥抱优先级和抗压缩优先级，让视图遵循外部约束
        animatedView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        animatedView.setContentHuggingPriority(.defaultLow, for: .vertical)
        animatedView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        animatedView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        // 网络 WebP 动图 URL
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

        return animatedView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

#Preview {
    ContentView()
}
