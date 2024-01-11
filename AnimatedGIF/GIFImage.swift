//
//  GIFImage.swift
//  AnimatedGIF
//
//  Created by Doris Wen on 2024/1/11.
//

import SwiftUI
import WebKit

struct GIFImage: UIViewRepresentable {
    private let name: String

    init(_ name: String){
        self.name = name
    }


    func makeUIView(context: Context) -> some WKWebView {

        let webView = WKWebView()

        let url = Bundle.main.url(forResource: name, withExtension: "gif")!

        let data = try! Data(contentsOf: url)

        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )

        webView.scrollView.isScrollEnabled = false

        return webView
    }
    //you need to get the uiView you made in makeView function
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
}

#Preview {
    GIFImage("delete")
}
