//
//  HTMLView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    let html: String

    func makeUIView(context: Context) -> WKWebView {
        let wv = WKWebView()
      
        return wv
    }

    func updateUIView(_ webView: WKWebView, context: Context) {

        let wrapped = """
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
              body { font-family: -apple-system, HelveticaNeue; font-size: 16px; color: #111; margin: 0; padding: 0 16px 24px; }
              img, iframe, video { max-width: 100%; height: auto; }
              * { word-wrap: break-word; }
            </style>
          </head>
          <body>\(html)</body>
        </html>
        """
        webView.loadHTMLString(wrapped, baseURL: nil)
    }
}


//#Preview {
//    HTMLView()
//}
